//
//  PopupView.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/07.
//

import NavigationStack
import SwiftUI

struct PopupView: View {
    @Binding var isPresenting: Bool
    @Binding var isClicked: Bool
    @State var isCameraPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @ObservedObject var classifier: ImageClassifier
    @EnvironmentObject var chosen: ChosenFood
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    @EnvironmentObject var chosenDragon: ChosenDragon

    var body: some View {
        ZStack {
            ZStack {
                Color.white.cornerRadius(20)
                RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2.0)
                VStack(alignment: .center, spacing: 0) {
                    Text("내가 가진 식재료의 사진을 찍어\n\(chosenDragon.chosenDragon.1)에게 맛있는 밥을 만들어 줄까요?")
                        .multilineTextAlignment(.center)
                        .font(.cookierun(.regular, size: 24))
                        .padding(.top)
                    Image("guide").resizable().scaledToFit().scaleEffect(0.7)
                        .offset(y: -UIScreen.height * 0.02)
                }
                .padding(.vertical, 15)
            }
            .frame(width: UIScreen.width * 0.6, height: UIScreen.height * 0.76)
            .padding(.top, isPresenting ? 0 : UIScreen.height * 3)

            Image(systemName: "xmark")
                .font(.system(size: 28, weight: .regular))
                .padding(.leading, UIScreen.width * 0.52)
                .padding(.top, isPresenting ? -UIScreen.height * 0.33 : UIScreen.height * 3)
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
                        // UT용 파프리카만 나오도록 변경
                        chosen.chosenFood.0 = classifier.imageClass!
                        switch chosen.chosenFood.0 {
                        case "paprika":
                            chosen.chosenFood.1 = "파프리카"
                        case "carrot":
                            chosen.chosenFood.1 = "당근"
                            // 닭가슴살일 때 당근으로 저장
                        case "chicken":
                            chosen.chosenFood.0 = "carrot"
                            chosen.chosenFood.1 = "당근"
                            // 가지일 때 파프리카로 저장
                        case "eggplant":
                            chosen.chosenFood.0 = "paprika"
                            chosen.chosenFood.1 = "파프리카"
                            // 기본 파프리카로 저장
                        default:
                            chosen.chosenFood.0 = "paprika"
                            chosen.chosenFood.1 = "파프리카"
                        }
                        self.navigationStack.push(QuestView())
                    }
                }
        }
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(isPresenting: .constant(true), isClicked: .constant(false), classifier: ImageClassifier())
            .environmentObject(ChosenFood())
            .environmentObject(ChosenDragon())
    }
}
