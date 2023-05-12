//
//  MissionCompleteView.swift
//  DragonKitchen
//
//  Created by 허준혁 on 2023/05/12.
//

import SwiftUI
import NavigationStack

struct MissionCompleteView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("tableBG2")
                    .resizable()
                    .ignoresSafeArea()

                HStack {
                    Spacer()

                    PolaroidView()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 10)
                        .frame(width: UIScreen.width / 2, height: UIScreen.height * 2 / 3)
                        .rotationEffect(.degrees(-3))

                    Spacer()

                    VStack {
                        Text("미션 성공!")
                            .font(.system(size: 40))
                            .font(.cookierun(.bold))

                        PushView(destination: MainView()
                            .environmentObject(ChosenFood())
                            .environmentObject(ChosenDragon())
                            .environmentObject(gageVariables())
                            .environmentObject(CurrentPageModel())
                        ) {
                            RoundedButton(widthScale: 0.25, heightScale: 0.148, sfSymbolName: "house.fill", content: "홈으로 나가기", contentSize: 23, contentColor: .buttonTextColor, isActive: true)
                                .padding()
                        }
                    }
                    .offset(y: 15)
                }
            }
        }
    }
}

struct MissionCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        MissionCompleteView()
    }
}
