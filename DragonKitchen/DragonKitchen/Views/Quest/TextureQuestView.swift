//
//  TextureQuestView.swift
//  DragonKitchen
//
//  Created by Seohyun Hwang on 2023/05/11.
//

import SwiftUI

struct TextureQuestView: View {
    @State var selectedColor: Int = 0
    @Binding var isCleared: Bool
    @State private var foodImage: String = "basketball_red"
    @EnvironmentObject var chosen: ChosenFood // 시각에서 선택한 색을 불러오는 변수

    var body: some View {
        ZStack {
            // 테이블 배경
            Image("tableBG1")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack(spacing: UIScreen.width * 0.05) {
                    if !isCleared {
                        switch chosen.chosenFood.0 {
                        case "paprika": PaprikaImageView().scaleEffect(0.8)
                        case "carrot": CarrotImageView().scaleEffect(0.8)
                        default: PaprikaImageView().scaleEffect(0.8)
                        }
                    } else {
                    Image(foodImage)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.82)
                        .padding(.leading, 20)
                    }
                    // 색상 버튼 6개
                    TextureButton(isCleared: $isCleared, foodImage: $foodImage)
                } // -------- HStack
                .frame(height: UIScreen.height * 0.7)
            } // --------- VStack
        } // --------- ZStack
    }
}

struct TextureButton: View {
    @Binding var isCleared: Bool
    @State var selectedButton: Int?
    @Binding var foodImage: String
    @EnvironmentObject var color: ChosenFood // 시각에서 선택한 색을 불러오는 변수
    @State var selectedTexture: String = ""

    let textures: [String] = ["basketball", "glass", "sand", "golf", "wood", "wool"]

    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.fixed(100), spacing: 23),
                GridItem(.fixed(100), spacing: 23),
                GridItem(.fixed(100)),
            ],
            spacing: 13
        ) { // 색상버튼 여섯 개의 동작
            ForEach(textures.indices, id: \.self) { index in
                Button(action: {
                    isCleared = true
                    selectedTexture = textures[index]
                    // 음식 이미지를 "재질_색" 으로 바꾸기
                    foodImage = "\(selectedTexture)_\(color.chosenColor)"
                    selectedButton = index
                }) {
                    // 색상 버튼 모양
                    Image(textures[index])
                        .resizable()
                        .clipShape(Circle())
                        .overlay(Circle().strokeBorder(Color.white, lineWidth: 6))
                        .overlay(Circle().stroke(selectedButton == index ? Color.black : Color.gray, lineWidth: selectedButton == index ? 3 : 1))
                        .frame(width: 100, height: 100)
                }
            }
        } // 색상 버튼 위치 조정
    }
}

struct TextureQuestView_Previews: PreviewProvider {
    static var previews: some View {
        TextureQuestView(isCleared: .constant(false)).previewInterfaceOrientation(.landscapeRight)
            .environmentObject(ChosenFood())
            .environmentObject(VegetableColor())
    }
}
