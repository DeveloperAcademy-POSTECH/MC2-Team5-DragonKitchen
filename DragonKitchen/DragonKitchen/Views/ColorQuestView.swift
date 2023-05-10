//
//  ColorQuestVIew.swift
//  DinoDina
//
//  Created by Seohyun Hwang on 2023/05/09.
//
import SwiftUI

struct ColorQuestView: View {

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
                    // 파프리카 크기 & 위치
                    Image(paprikaImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .padding(.leading, UIScreen.width/30)
                        .padding(.bottom, UIScreen.height/30)
                    Spacer()
                    
                    // 색 버튼 6개
                    ColorButton(isCleared: $isCleared, paprikaImage: $paprikaImage)
                } // -------- HStack
            } // --------- VStack
        } // --------- ZStack
    }
}

struct ColorButton : View {
    
    @Binding var isCleared: Bool
    @Binding var paprikaImage: String
    
    let colors: [Color] = [Color.paprikaRed, Color.vegiGreen, Color.paprikaBurgundy, Color.paprikaOrange, Color.paprikaYellow, Color.paprikaBrown]
    
    let paprikaColor : [String] = ["paprikaRed_shadow", "paprikaGreen_shadow", "paprikaBurgundy_shadow", "paprikaOrange_shadow", "paprikaYellow_shadow", "paprikaBrown_shadow"]
    
    var body: some View {
        LazyVGrid(
            columns : [
                GridItem(.fixed(100), spacing: 23),
                GridItem(.fixed(100), spacing: 23),
                GridItem(.fixed(100))
            ],
            spacing: 13) {
                ForEach(colors.indices, id: \.self) { index in
                    Button(action: {
                        isCleared = true
                        paprikaImage = paprikaColor[index]
                    }) {
                        Circle()
                            .fill(colors[index])
                            .overlay(Circle().strokeBorder(Color.white, lineWidth: 6))
                            .overlay(Circle().strokeBorder(Color.gray, lineWidth: 1))
                            .frame(width: 100, height: 100)
                    }
                }
            }
            .padding(.trailing, UIScreen.width/15)
            .padding(.bottom, UIScreen.height/30)
    }
}


struct ColorQuestView_Previews: PreviewProvider {
    static var previews: some View {
        
        ColorQuestView().previewInterfaceOrientation(.landscapeRight)
    }
}
