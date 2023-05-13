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
    @State var isHielGray = false
    @State var isPluGray = false
    @State var isHielGlow = false
    @State var isPluGlow = false
    @State var buttonWidth = UIScreen.width * 0.075
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
                    }
                    else {
                        PushView(destination: MainView(), destinationId: "mainViewId") {
                            Image("GoButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: buttonWidth)
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
