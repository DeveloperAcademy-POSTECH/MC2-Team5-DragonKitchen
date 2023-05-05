//
//  FoodCameraView.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/03.
//

import NavigationStack
import SwiftUI

struct FoodCameraView: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .camera
    var classifier: ImageClassifier
    @ObservedObject var chosen: chosenFruit
        var body: some View
    {
        VStack {
            Button {
                isPresenting = true

            } label: {
                Image(systemName: "camera.fill")
                    .font(.largeTitle)
            }
//            PushView(destination: FoodResultView()) {
//                Text("next View")
//            }
        }
        .fullScreenCover(isPresented: $isPresenting) {
            ImagePicker(uiImage: $uiImage, isPresenting: $isPresenting, sourceType: $sourceType)
                .edgesIgnoringSafeArea(.all)
                .onDisappear {
                    if uiImage != nil {
                        classifier.detect(uiImage: uiImage!)
                    }
                }
        }
    }
}

struct FoodCameraView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCameraView(classifier: ImageClassifier(), chosen: chosenFruit())
    }
}
