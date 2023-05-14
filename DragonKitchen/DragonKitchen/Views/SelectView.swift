//
//  SelectView.swift
//  DragonKitchen
//
//  Created by 김기영 on 2023/05/10.
//

import NavigationStack
import SwiftUI

struct SelectView: View {
    let eggWidth = UIScreen.width * 0.21
    @EnvironmentObject var chosen: ChosenDragon
    @EnvironmentObject var gageVar: gageVariables
    @State var isHielGray = false
    @State var isPluGray = false
    @State var isHielGlow = false
    @State var isPluGlow = false
    @State var buttonWidth = UIScreen.width * 0.078
    @State var buttonYOffset = UIScreen.height * 0.05
    var body: some View {
        ZStack {
            Color.questBackgroundColor
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Spacer().frame(width: UIScreen.width * 0.25)
                    Text("어떤 드래곤을 키울까요?")
                        .font(.cookierun(.regular, size: 35))
                    Spacer()
                    if chosen.chosenDragon == ("", "") {
                        Image("DisabledGoButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: buttonWidth)
                            .offset(y: UIScreen.height * 0.04 + buttonYOffset)
                    }
                    else {
                        PushView(destination: EggView()) {
                            Image("GoButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: buttonWidth)
                                .offset(y: UIScreen.height * 0.04 + buttonYOffset)
                        }
                    }
                }
                HStack {
                    VStack {
                        Image("EggPlu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: eggWidth)
                            .shadow(color: isPluGray ? .clear : .buttonColor, radius: isPluGlow ? 10 : 0)
                            .animation(.easeInOut.repeatForever(), value: isPluGlow)
                            .grayscale(isPluGray ? 1 : 0)
                            .onTapGesture {
                                isHielGray = true
                                isPluGray = false
                                isPluGlow = true
                                chosen.chosenDragon = ("Plu", "플루")
                                //User Test 용 코드
                                gageVar.turnRed1 = true
                                gageVar.turnRed2 = true
                                gageVar.turnRed3 = true
                                gageVar.turnOrange1 = true
                                gageVar.turnOrange2 = true
                                gageVar.turnOrange3 = true
                                gageVar.turnGreen1 = true
                                gageVar.turnGreen2 = true
                                gageVar.greenCount = 2
                                gageVar.redCount = 3
                                gageVar.orangeCount = 3
                                //User Test 용 코드 끝
                                
                            }
                        Text("플루")
                            .font(.cookierun(.regular))
                    }
                    Spacer().frame(width: UIScreen.width * 0.11)
                    VStack {
                        Image("EggHiel")
                            .resizable()
                            .scaledToFit()
                            .frame(width: eggWidth)
                            .shadow(color: isHielGray ? .clear : .buttonColor, radius: isHielGlow ? 10 : 0)
                            .animation(.easeInOut.repeatForever(), value: isHielGlow)
                            .grayscale(isHielGray ? 1 : 0)
                            .onTapGesture {
                                isPluGray = true
                                isHielGray = false
                                isHielGlow = true
                                chosen.chosenDragon = ("Hiel", "이엘")
                                //User Test 용 코드
                                gageVar.turnRed1 = true
                                gageVar.turnRed2 = true
                                gageVar.turnRed3 = true
                                gageVar.turnOrange1 = true
                                gageVar.turnOrange2 = true
                                gageVar.turnOrange3 = true
                                gageVar.turnGreen1 = true
                                gageVar.turnGreen2 = true
                                gageVar.greenCount = 2
                                gageVar.redCount = 3
                                gageVar.orangeCount = 3
                                //User Test 용 코드 끝
                            }
                        Text("이엘")
                            .font(.cookierun(.regular))
                    }
                }
            }
            .foregroundColor(.black)
        }
    }
}

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView()
            .previewInterfaceOrientation(.landscapeRight)
            .environmentObject(ChosenDragon())
    }
}
