//
//  ColorQuestVIew.swift
//  DinoDina
//
//  Created by Seohyun Hwang on 2023/05/09.
//
import SwiftUI

struct ColorQuestView: View {

    @State var isCleared: Bool = false
    @EnvironmentObject var name: ChosenFood
    @State var foodImage: String = ""
    
    var body: some View {
        
        ZStack {
            // 테이블 배경
            Image("tableBG1")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // 네비게이션바
//                NavigationBar(isCleared: $isCleared)

                Spacer()
                
                HStack {
                    // 파프리카 이미지 변경 및 위치 설정
                    Image(foodImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .padding(.leading, UIScreen.width/30)
                        .padding(.bottom, UIScreen.height/30)
                
                    Spacer()
                    
                    // 색상 버튼 6개
                    ColorButton(isCleared: $isCleared, foodImage: $foodImage)
                    
                }
            }
        }
        .onAppear{
            if foodImage == "" {
//                foodImage = name.chosenFood + "Gray_shadow"
            }
        }
    }
}

struct ColorButton : View {
    
    @Binding var isCleared: Bool
    @Binding var foodImage: String
    @State var selectedButton : Int?
    @EnvironmentObject var color: ChosenFood // 선택한 색상을 저장해두는 변수
    
    let colors: [Color] = [Color.paprikaRed, Color.vegiGreen, Color.paprikaBurgundy, Color.paprikaOrange, Color.paprikaYellow, Color.paprikaBrown]
    
    let foodColor : [String] = ["paprikaRed_shadow", "paprikaGreen_shadow", "paprikaBurgundy_shadow", "paprikaOrange_shadow", "paprikaYellow_shadow", "paprikaBrown_shadow"]
    
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
                        foodImage = foodColor[index]
                        selectedButton = index
                        
                        if(index == 0) { // 첫번째 버튼 : 빨강
                            color.chosenColor = "red"
                        }
                        else if(index == 1) { // 두번째 버튼 : 초록
                            color.chosenColor = "green"
                        }
                        else if(index == 2) { // 세번째 버튼 : 버건디
                            color.chosenColor = "burgundy"
                        }
                        else if(index == 3) { // 네번째 버튼 : 주황
                            color.chosenColor = "orange"
                        }
                        else if(index == 4) { // 다섯번째 버튼 : 노랑
                            color.chosenColor = "yellow"
                        }
                        else { // 여섯번째 버튼 : 갈색
                            color.chosenColor = "brown"
                        }
                        
                    }) {
                        // 색상 버튼 모양
                        Circle()
                            .fill(colors[index])
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

struct ColorQuestView_Previews: PreviewProvider {
    
    static var previews: some View {
        ColorQuestView().previewInterfaceOrientation(.landscapeRight)
    }
}
