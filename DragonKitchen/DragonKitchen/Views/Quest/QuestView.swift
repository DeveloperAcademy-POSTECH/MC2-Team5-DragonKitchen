//
//  NavigatingView.swift
//  DragonKitchen
//
//  Created by 박상원 on 2023/05/11.
//

import NavigationStack
import SwiftUI

struct QuestView: View {
    @EnvironmentObject var currentPage: CurrentPageModel
    @EnvironmentObject var chosenDragon: ChosenDragon
    @EnvironmentObject var chosenFood: ChosenFood
    @State var isQuestCleared: [Bool] = Array(repeating: false, count: 5)
    @State var isTastePopupActive: Bool = false
    @State var isDimmed: Bool = false
    @State var isQuestStarted: Bool = false
    @State var index: Int = 1
    @State var foodInfo: [(imageName: String, recipe: String)] = [("_raw", "생으로"), ("_toast", "구워"), ("_fry", "볶아")]
    var body: some View {
        ZStack {
            if isQuestStarted{
                VStack {
                    NavigationBar(isCleared: $isQuestCleared, isPopupActive: $isTastePopupActive, isDimmed: $isDimmed)
                        .padding(.horizontal, UIScreen.width * 0.07)
                        .ignoresSafeArea()
                    Spacer()
                }
            .zIndex(1)
            }
            switch currentPage.currentPage {
            case .eye:
                ColorQuestView(isCleared: $isQuestCleared[currentPage.currentPage.rawValue - 1])
            case .hand:
                TextureQuestView(isCleared: $isQuestCleared[currentPage.currentPage.rawValue - 1])
            case .ear:
                QuestHearView(isCleared: $isQuestCleared[currentPage.currentPage.rawValue - 1])
            case .nose:
                NoseView(isCleared: $isQuestCleared[currentPage.currentPage.rawValue - 1])
                    .onAppear {
                        isQuestCleared[3] = true
                    }
            case .mouth:
                TasteView(index: $index, isPopupActive: $isTastePopupActive, isDimmed: $isDimmed, isCleared: $isQuestCleared[currentPage.currentPage.rawValue - 1], foodInfo: $foodInfo)
            }
            if isDimmed {
                Color.black.opacity(0.2).zIndex(2).ignoresSafeArea()
            }
            if !isQuestStarted {
                FoodResultView()
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.8).delay(3.0)) {
                            isQuestStarted = true
                        }
                    }
            }
        }
        .overlay {
            ZStack {
                ZStack {
                    Color.white.cornerRadius(20)
                    RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2.0)
                    VStack(alignment: .center, spacing: 0) {
                        Text("\(chosenDragon.chosenDragon.1)\(chosenDragon.chosenDragon.0 == "Plu" ? "에게" : "이에게") \(chosenFood.chosenFood.1)\(chosenFood.chosenFood.0 == "paprika" ? "를" : "을") \(foodInfo[index - 1].1) 주고\n함께 사진을 찍어볼까요?")
                            .multilineTextAlignment(.center)
                            .font(.cookierun(.regular))
                            .padding(.top)
                        Image(foodInfo[index - 1].0)
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(0.65)
                    }
                    .padding(.vertical, 15)
                }
                .frame(width: UIScreen.width * 0.6, height: UIScreen.height * 0.76)
                .padding(.top, isTastePopupActive ? 0 : UIScreen.height * 3)

                Image(systemName: "xmark")
                    .font(.system(size: 28, weight: .ultraLight))
                    .padding(.leading, UIScreen.width * 0.53)
                    .padding(.top, isTastePopupActive ? -UIScreen.height * 0.35 : UIScreen.height * 3)
                    .foregroundColor(Color(red: 153 / 255, green: 153 / 255, blue: 153 / 255))
                    .onTapGesture {
                        isDimmed = false
                        withAnimation(.easeIn(duration: 0.3)) {
                            isTastePopupActive = false
                        }
                    }
                ZStack {
                    PushView(destination: CustomCameraPhotoView()) {
                        RoundedButton(widthScale: 0.3, heightScale: 0.148, content: "좋아요!", contentSize: 25, contentColor: .buttonTextColor, isActive: true)
                    }
                }
                .padding(.top, isTastePopupActive ? UIScreen.height * 0.75 : UIScreen.height * 3)
            }
            .foregroundColor(.black)
        }
    }
}

struct QuestView_Previews: PreviewProvider {
    static var previews: some View {
        QuestView()
            .environmentObject(CurrentPageModel())
            .environmentObject(ChosenFood())
            .environmentObject(ChosenDragon())
            .environmentObject(VegetableColor())
    }
}
