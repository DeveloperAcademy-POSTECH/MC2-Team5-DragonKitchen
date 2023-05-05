//
//  CameraView.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/03.
//

import CoreML
import SwiftUI
import UIKit

struct CameraView: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    // 우리의 이미지 분류기
//    var classifier = Classifier()
    @ObservedObject var classifier: ImageClassifier

    var body: some View {
        VStack {
            HStack {
//                Image(systemName: "photo")
//                    .onTapGesture {
//                        isPresenting = true
//                        sourceType = .photoLibrary
//                    }
                Image(systemName: "camera")
                    .onTapGesture {
                        isPresenting = true
                        sourceType = .camera
                    }
            }
            .font(.largeTitle)
            .foregroundColor(.blue)

            Rectangle()
                .strokeBorder()
                .foregroundColor(.yellow)
                .overlay(Group {
                    if uiImage != nil {
                        Image(uiImage: uiImage!)
                            .resizable()
                            .scaledToFit()
                    }
                }
                )
            VStack {
                Button(action: {
                    if uiImage != nil {
                        classifier.detect(uiImage: uiImage!)
                    }
                }) {
                    Image(systemName: "bolt.fill")
                        .foregroundColor(.red)
                        .font(.title)
                }
                Group{
                    if let imageClass = classifier.imageClass{
                        HStack{
                            Text("Image categories:")
                                .font(.caption)
                            Text(imageClass)
                                .bold()
                        }
                    }else{
                        HStack{
                            Text("Image categories: NA")
                                .font(.caption)
                        }
                    }
                }
                .font(.subheadline)
                .padding()
            }
        }
        .sheet(isPresented: $isPresenting) {
            ImagePicker(uiImage: $uiImage, isPresenting: $isPresenting, sourceType: $sourceType)
                .onDisappear{
                    if uiImage != nil{
                        classifier.detect(uiImage: uiImage!)
                    }
                }
        }
        .padding()
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView(classifier: ImageClassifier())
    }
}
