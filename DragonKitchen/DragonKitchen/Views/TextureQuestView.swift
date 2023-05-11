//
//  TextureQuestView.swift
//  DragonKitchen
//
//  Created by Seohyun Hwang on 2023/05/11.
//

import SwiftUI

struct TextureQuestView: View {
    @State var selectedColor : Int = 0
    @State var isCleared: Bool = false
    @State private var foodImage: String = ""
    @EnvironmentObject var color: ChosenFood // 시각에서 선택한 색을 불러오는 변수
    
    var body: some View {
        ZStack {
            // 테이블 배경
            Image("tableBG1")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // 네비게이션바
                NavigationBar(isCleared: $isCleared)
                
                Spacer()
                
                HStack {
                    Image(foodImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .padding(.leading, UIScreen.width/30)
                        .padding(.bottom, UIScreen.height/30)
                    
                    Spacer()
                    
                    // 색상 버튼 6개
                    TextureButton(isCleared: $isCleared, foodImage: $foodImage)
                } // -------- HStack
            } // --------- VStack
        } // --------- ZStack
        .onAppear() {
            if foodImage == "" {
                foodImage = "paprika" + color.chosenColor + "_shadow"
            }
        }
    }
}

struct TextureQuestView_Previews: PreviewProvider {
    
    static var previews: some View {
        TextureQuestView().previewInterfaceOrientation(.landscapeRight)
    }
}

