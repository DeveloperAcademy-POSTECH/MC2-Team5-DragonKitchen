//
//  TestMainView.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/03.
//

import SwiftUI

struct TestMainView: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @ObservedObject var classifier: ImageClassifier
    @State var imageClass: String?
    var body: some View {
        VStack {
            Image(systemName: "bolt.fill")
                .foregroundColor(.red)
                .onTapGesture {
                    isPresenting = true
                    sourceType = .camera
                }
            Text(imageClass != nil ? imageClass! : "NA")
        }
        .sheet(isPresented: $isPresenting) {
            ImagePicker(uiImage: $uiImage, isPresenting: $isPresenting, sourceType: $sourceType)
                .onDisappear {
                    if uiImage != nil {
                        print("detect!")
                        classifier.detect(uiImage: uiImage!)
                        imageClass = classifier.imageClass
                    }
                }
        }
    }
}

struct TestMainView_Previews: PreviewProvider {
    static var previews: some View {
        TestMainView(classifier: ImageClassifier())
    }
}
