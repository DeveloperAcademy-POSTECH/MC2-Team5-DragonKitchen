//
//  MissionCompleteView.swift
//  DragonKitchen
//
//  Created by 허준혁 on 2023/05/12.
//

import ConfettiSwiftUI
import NavigationStack
import SwiftUI

struct MissionCompleteView: View {
    @EnvironmentObject var gage: gageVariables
    @EnvironmentObject var navigate: NavigateModel
    @EnvironmentObject var sound: SoundEffect
    @State var confettiCounter: Int = 0
    var body: some View {
        NavigationStack {
            ZStack {
                Image("tableBG2")
                    .resizable()
                    .ignoresSafeArea()
                    .onAppear {
                        confettiCounter += 1
                        sound.endEffect.play()
                    }

                HStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .fill(.clear)
                            .confettiCannon(counter: $confettiCounter, repetitions: 100, repetitionInterval: 1.5)
                            .offset(x: -UIScreen.width * 0.2)
                        PolaroidView()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                            .frame(width: UIScreen.width * 0.534, height: UIScreen.width * 0.33)
                            .rotationEffect(.degrees(-3))
                    }
                    Spacer()
                    ZStack {
                        Rectangle()
                            .fill(.clear)
                            .confettiCannon(counter: $confettiCounter, repetitions: 100, repetitionInterval: 1.5)
                            .offset(x: UIScreen.width * 0.1)
                        VStack {
                            Text("미션 성공!")
                                .font(.cookierun(.regular, size: 36))
                                .foregroundColor(.black)

                            PushView(destination: MainView()) {
                                RoundedButton(widthScale: 0.25, heightScale: 0.148, sfSymbolName: "house.fill", content: "홈으로 나가기", contentSize: 23, contentColor: .buttonTextColor, isActive: true)
                                    .padding()
                                    .onAppear {
                                        if gage.greenCount == 2 {
                                            gage.greenCount += 1
                                            gage.turnGreen3 = true
                                            gage.isEvolution = true
                                        }
                                    }
                            }
                            .simultaneousGesture(TapGesture().onEnded {
                                sound.navEffect.play()
                                navigate.navigateBook = true
                            })
                        }
                        .offset(y: 15)
                    }
                }
            }
        }
    }
}

struct MissionCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        MissionCompleteView()
            .environmentObject(ChosenFood())
            .environmentObject(ChosenDragon())
            .environmentObject(gageVariables())
            .environmentObject(NavigateModel())
    }
}
