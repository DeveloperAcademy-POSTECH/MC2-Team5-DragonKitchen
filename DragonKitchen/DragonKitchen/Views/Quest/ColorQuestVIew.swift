//
//  ColorQuestVIew.swift
//  DinoDina
//
//  Created by Seohyun Hwang on 2023/05/09.
//
import SwiftUI

struct ColorQuestView: View {
    @Binding var isCleared: Bool
    @EnvironmentObject var chosenFood: ChosenFood

    var body: some View {
        ZStack {
            // 테이블 배경
            Image("tableBG1")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack(spacing: UIScreen.width * 0.05) {
                    // 파프리카 이미지 변경 및 위치 설정
                    Group {
                        switch chosenFood.chosenFood.0 {
                        case "paprika":
                            PaprikaImageView()
                                .environmentObject(VegetableColor())
                                .environmentObject(ChosenFood())
                        case "carrot":
                            CarrotImageView()
                                .environmentObject(VegetableColor())
                                .environmentObject(ChosenFood())
                        default:
                            Image("")
                        }
                    }
                    .scaleEffect(0.8)
                    // 색상 버튼 6개
                    ColorButton(isCleared: $isCleared)
                }
                .frame(height: UIScreen.height * 0.7)
            }
        }
    }
}

struct ColorButton: View {
    @Binding var isCleared: Bool
    @State var selectedButton: Int?
    @EnvironmentObject var chosen: ChosenFood // 선택한 색상을 저장해두는 변수
    @EnvironmentObject var foodColor: VegetableColor

    let colors: [Color] = [.paprikaRed, .paprikaGreen, .paprikaBurgundy, .paprikaOrange, .paprikaYellow, .paprikaBrown]
    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.fixed(100), spacing: 23),
                GridItem(.fixed(100), spacing: 23),
                GridItem(.fixed(100)),
            ],
            spacing: 13
        ) {
            ForEach(colors.indices, id: \.self) { index in
                Button(action: {
                    isCleared = true
                    selectedButton = index

                    if index == 0 { // 첫번째 버튼 : 빨강
                        chosen.chosenColor = "red"
                        switch chosen.chosenFood.0 {
                        case "paprika":
                            foodColor.paprikaColor = PaprikaColor().red
                        case "carrot":
                            foodColor.carrotColor = CarrotColor().red
                        default: break
                        }
                    }
                    else if index == 1 { // 두번째 버튼 : 초록
                        chosen.chosenColor = "green"
                        switch chosen.chosenFood.0 {
                        case "paprika":
                            foodColor.paprikaColor = PaprikaColor().green
                        case "carrot":
                            foodColor.carrotColor = CarrotColor().green
                        default: break
                        }
                    }
                    else if index == 2 { // 세번째 버튼 : 버건디
                        chosen.chosenColor = "burgundy"
                        switch chosen.chosenFood.0 {
                        case "paprika":
                            foodColor.paprikaColor = PaprikaColor().burgundy
                        case "carrot":
                            foodColor.carrotColor = CarrotColor().burgundy
                        default: break
                        }
                    }
                    else if index == 3 { // 네번째 버튼 : 주황
                        chosen.chosenColor = "orange"
                        switch chosen.chosenFood.0 {
                        case "paprika":
                            foodColor.paprikaColor = PaprikaColor().orange
                        case "carrot":
                            foodColor.carrotColor = CarrotColor().orange
                        default: break
                        }
                    }
                    else if index == 4 { // 다섯번째 버튼 : 노랑
                        chosen.chosenColor = "yellow"
                        switch chosen.chosenFood.0 {
                        case "paprika":
                            foodColor.paprikaColor = PaprikaColor().yellow
                        case "carrot":
                            foodColor.carrotColor = CarrotColor().yellow
                        default: break
                        }
                    }
                    else { // 여섯번째 버튼 : 갈색
                        chosen.chosenColor = "brown"
                        switch chosen.chosenFood.0 {
                        case "paprika":
                            foodColor.paprikaColor = PaprikaColor().brown
                        case "carrot":
                            foodColor.carrotColor = CarrotColor().brown
                        default: break
                        }
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
        .padding(.trailing, UIScreen.width / 15)
        .padding(.bottom, UIScreen.height / 30)
    }
}

struct ColorQuestView_Previews: PreviewProvider {
    static var previews: some View {
        ColorQuestView(isCleared: .constant(false))
            .previewInterfaceOrientation(.landscapeRight)
            .environmentObject(VegetableColor())
            .environmentObject(ChosenFood())
    }
}
