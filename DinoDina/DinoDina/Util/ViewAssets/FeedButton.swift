//
//  TestMainView.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/03.
//

import SwiftUI
import NavigationStack

struct FeedButton: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @ObservedObject var classifier: ImageClassifier
    @EnvironmentObject var chosen: ChosenFood
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    
    var body: some View {
        VStack {
            Button {
                isPresenting = true
            } label: {
                Image("Dish")
                    .frame(width: 100, height: 100)
//                    .resizable()
                    //                    .scaleEffect(0.5)
                
//                    .font(.system(size: 30))
            }
        }
        // 카메라 화면
        .fullScreenCover(isPresented: $isPresenting) {
            ImagePicker(uiImage: $uiImage, isPresenting: $isPresenting, sourceType: $sourceType)
                .edgesIgnoringSafeArea(.all)
                .onDisappear {
                    if uiImage != nil {
                        classifier.detect(uiImage: uiImage!)
                        chosen.chosenFood = classifier.imageClass!
                    }
                }
        }
        .onChange(of: chosen.chosenFood){ _ in
            print("changed!!")
            self.navigationStack.push(FoodResultView())
        }
    }
}

struct FeedButton_Previews: PreviewProvider {
    static var previews: some View {
        FeedButton(classifier: ImageClassifier())
    }
}
