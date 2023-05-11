//
//  TextureQuestView.swift
//  DragonKitchen
//
//  Created by Seohyun Hwang on 2023/05/11.
//

import SwiftUI

struct TextureQuestView: View {
    let textures: [String] = ["basketball", "glass", "sand", "golf", "wood", "wool"]
    @State var selectedColor : Int = 0
    @State var isCleared: Bool = false
    @EnvironmentObject var chosen: ChosenFood
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
                       Image(chosen.chosenFood)
                           .resizable()
                           .scaledToFit()
                           .frame(width: 250)
                           .padding(.leading, UIScreen.width/30)
                           .padding(.bottom, UIScreen.height/30)
                       
                       Spacer()
                           
                       // 색상 버튼 6개
                       TextureButton(isCleared: $isCleared)
                   } // -------- HStack
               } // --------- VStack
           } // --------- ZStack
       }

struct TextureButton : View {
    
    let textures: [String] = ["basketball", "glass", "sand", "golf", "wood", "wool"]
    
    @Binding var isCleared: Bool
    @State var selectedButton : Int?
    @EnvironmentObject var chosen: ChosenFood
//    let buttons = [0, 1, 2, 3, 4, 5]
    
    let paprikaTexture : [String] = ["sand_red", "sand_green", "sand_burgundy", "sand_orange", "sand_yellow", "sand_brown"]
    
    var body: some View {
        LazyVGrid(
            columns : [
                GridItem(.fixed(100), spacing: 23),
                GridItem(.fixed(100), spacing: 23),
                GridItem(.fixed(100))
            ],
            spacing: 13) {
                ForEach(textures.indices, id: \.self) { index in
                    Button(action: {
                        isCleared = true
                        chosen.chosenFood = paprikaTexture[index]
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
}


struct TextureQuestView_Previews: PreviewProvider {
    static var previews: some View {
        TextureQuestView().previewInterfaceOrientation(.landscapeRight)
            .environmentObject(ChosenFood())
    }
}

