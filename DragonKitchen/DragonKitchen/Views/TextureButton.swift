//
//  TextureButton.swift
//  DragonKitchen
//
//  Created by Seohyun Hwang on 2023/05/11.
//

import SwiftUI

struct TextureButton : View {
    
    @Binding var isCleared: Bool
    @State var selectedButton : Int?
    @Binding var foodImage: String
    @EnvironmentObject var color: ChosenFood // 시각에서 선택한 색을 불러오는 변수
    @State var selectedTexture : String = ""
    
    let textures: [String] = ["basketball", "glass", "sand", "golf", "wood", "wool"]
    
    var body: some View {
        LazyVGrid(
            columns : [
                GridItem(.fixed(100), spacing: 23),
                GridItem(.fixed(100), spacing: 23),
                GridItem(.fixed(100))
            ],
            spacing: 13) { // 색상버튼 여섯 개의 동작
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
            .padding(.trailing, UIScreen.width/15)
            .padding(.bottom, UIScreen.height/30)
    }
}
