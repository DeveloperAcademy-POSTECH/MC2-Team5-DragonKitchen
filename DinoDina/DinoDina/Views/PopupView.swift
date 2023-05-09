//
//  PopupView.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/07.
//

import SwiftUI
import NavigationStack

struct PopupView: View {
    @Binding var isPresenting: Bool
    @Binding var isClicked: Bool
    @State var isCameraPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @ObservedObject var classifier: ImageClassifier
    @EnvironmentObject var chosen: ChosenFood
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    var body: some View {
        ZStack {
            ZStack {
                Color.white.cornerRadius(20)
                RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2.0)
                VStack(alignment: .center, spacing: 0) {
                    Text("내가 가진 식재료의 사진을 찍어")
                        .padding(.top, 20)
                        .font(.system(size: 20))
                    Text("이엘에게 맛있는 밥을 줄까요?")
                        .font(.system(size: 20))
//                    Image(systemName: "hand.tap").frame(height: 200)
                    Image("guide").resizable().scaledToFit()
                        .padding(.bottom, 20)
                    
                }
            }
            .frame(width: UIScreen.width * 0.6, height: UIScreen.height * 0.76)
            .padding(.top, isPresenting ? 0 : UIScreen.height * 3)

            Image(systemName: "xmark")
                .font(.system(size: 28, weight: .ultraLight))
                .padding(.leading, UIScreen.width * 0.53)
                .padding(.top, isPresenting ? -UIScreen.height * 0.35 : UIScreen.height * 3)
                .foregroundColor(Color(red: 153 / 255, green: 153 / 255, blue: 153 / 255))
                .onTapGesture {
                    withAnimation(.easeIn(duration: 0.3)) {
                        isClicked = false
                        isPresenting = false
                    }
                }
                ZStack {
                    RoundedButton(widthScale: 0.3, heightScale: 0.148, content: "좋아요!", contentSize: 25, contentColor: .buttonTextColor, isActive: true)
                }
                .onTapGesture {
                    isCameraPresenting = true
                }
            .padding(.top, isPresenting ? UIScreen.height * 0.75 : UIScreen.height * 3)
        }
        .foregroundColor(.black)
        .padding(.top)
        .fullScreenCover(isPresented: $isCameraPresenting) {
            ImagePicker(uiImage: $uiImage, isCameraPresenting: $isCameraPresenting, sourceType: $sourceType)
                .edgesIgnoringSafeArea(.all)
                .onDisappear {
                    if uiImage != nil {
                        classifier.detect(uiImage: uiImage!)
                        chosen.chosenFood = classifier.imageClass!
                    }
                }
        }
        .onChange(of: chosen.chosenFood) { _ in
            print("changed!!")
            self.navigationStack.push(FoodResultView())
        }
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(isPresenting: .constant(true), isClicked: .constant(false), classifier: ImageClassifier())
            .environmentObject(ChosenFood())
    }
}
