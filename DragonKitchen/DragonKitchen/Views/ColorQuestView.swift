//
//  ColorQuestVIew.swift
//  DinoDina
//
//  Created by Seohyun Hwang on 2023/05/09.
//
import SwiftUI

struct ColorQuestView: View {

    @State var selectedColor : Int = 0
    @State var isCleared: Bool = false
    @State var paprikaImage: String = "paprikaGray"
    
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
                
                    // 색 버튼 6개
                    ColorButton(isCleared: $isCleared, paprikaImage: $paprikaImage, selectedColor: $selectedColor)
                } // -------- HStack
            } // --------- VStack
        } // --------- ZStack
    }
}

struct ColorButton : View {
    
    @Binding var isCleared: Bool
    @Binding var paprikaImage: String
    @Binding var selectedColor : Int
    
    let colors: [Color] = [Color.paprikaRed, Color.vegiGreen, Color.paprikaBurgundy, Color.paprikaOrange, Color.paprikaYellow, Color.paprikaBrown]
    
    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.fixed(100), spacing: 23),
                GridItem(.fixed(100), spacing: 23),
                GridItem(.fixed(100))
            ],
            spacing: 13) {
                ForEach(colors.indices, id: \.self) { _ in
                    Button(action: {
                        isCleared = true
                        paprikaImage = "paprika"
                    }) {
                        Circle()
                            .fill(colors[index])
                            .overlay(Circle().strokeBorder(Color.white, lineWidth: 6))
                            .overlay(Circle().strokeBorder(Color.gray, lineWidth: 1))
                            .frame(width: 100, height: 100)
                    }
                }
            }
    }
}

struct ColorQuestView_Previews: PreviewProvider {
    static var previews: some View {
        
        ColorQuestView()
    }
}
