//
//  TextureQuestView.swift
//  DragonKitchen
//
//  Created by Seohyun Hwang on 2023/05/11.
//

import SwiftUI

struct TextureQuestView: View {
    let textures: [String] = ["basketballButton", "glassButton", "sandButton", "golfButton", "woodButton", "woolButton"]
    @State var selectedColor : Int = 0
    @State var isCleared: Bool = false
    @State var paprikaImage: String = "paprikaGray_shadow"
       
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
                       Image(paprikaImage)
                           .resizable()
                           .scaledToFit()
                       
                       Spacer()
                       
                       // 색 버튼 6개
                       LazyVGrid(
                           columns: [
                               GridItem(.fixed(100), spacing: 23),
                               GridItem(.fixed(100), spacing: 23),
                               GridItem(.fixed(100))
                           ],
                           spacing: 13) {
                               ForEach(textures.indices, id: \.self) { index in
                                   Button(action: {
                                       isCleared = true
                                       selectedColor = index
                                       paprikaImage = "paprika"
                                   }) {
                                       Image(textures[index])
                                           .resizable()
                                           .clipShape(Circle().size(width: 100, height: 100))
                                           .overlay(Circle().strokeBorder(Color.white, lineWidth: 6))
                                           .overlay(Circle().strokeBorder(Color.gray, lineWidth: 1))
                                           .frame(width: 100, height: 100)
                                   }
                               }
                           }
                   } // -------- HStack
               } // --------- VStack
           } // --------- ZStack
       }
   }


struct TextureQuestView_Previews: PreviewProvider {
    static var previews: some View {
        TextureQuestView().previewInterfaceOrientation(.landscapeRight)
    }
}

