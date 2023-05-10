//
//  ImagePickerView.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/03.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var uiImage: UIImage?
    @Binding var isCameraPresenting: Bool
    @Binding var sourceType: UIImagePickerController.SourceType
    // 여기서는 UIImagePickerController를 리턴해 줘야 합니다. 여기서 카메라를 보여줄지, 이미지 선택 뷰를 보여줄지 선택할 수 있습니다.
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        // .photoLibrary로 이미지 선택 뷰 보여주기 결정
        imagePicker.sourceType = sourceType
        // delegate를 context.coordinator로 설정
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_: UIImagePickerController, context _: Context) {}

    typealias UIViewControllerType = UIImagePickerController

    // coordinator class를 통해 ImagePickerViewController에게 사용자가 ImagePicker가 보여준 이미지를 골랐다는 것을 알려줍니다.
    // makdCoordinator 함수는 UIImageViewController를 delegate하는 함수로, coordinator를 만들어 줍니다.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // Coordinator class입니다.
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        init(_ imagePicker: ImagePicker) {
            parent = imagePicker
        }

        // 이 함수는 이미지가 선택되었을 때 이미지 데이터를 delegate에게 전해줍니다. 여기서 delegate는 데이터를 전달해 주는 역할을 한다고 생각하면 됩니다.
        func imagePickerController(_: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            parent.uiImage = info[.originalImage] as? UIImage
            parent.isCameraPresenting = false
        }

        func imagePickerControllerDidCancel(_: UIImagePickerController) {
            parent.isCameraPresenting = false
        }
    }
}
