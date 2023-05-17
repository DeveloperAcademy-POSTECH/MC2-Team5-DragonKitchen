
//  StatusView.swift
//  DinoDina
//
//  Created by 김기영 on 2023/05/08.
//

import SwiftUI

struct StatusView: View {
    @EnvironmentObject var gageVar: gageVariables
    @EnvironmentObject var chosen: ChosenDragon
    @State var gageWidthIn: CGFloat = UIScreen.width * 0.025
    @State var gageHeightIn: CGFloat = UIScreen.width * 0.025
    let statusYOffset: CGFloat = UIScreen.height * -0.01

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: UIScreen.width * 0.5, height: UIScreen.height * 0.09)
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                .opacity(0.5)
                .offset(x: UIScreen.width * 0.02, y: statusYOffset)
            HStack {
                VStack(spacing: 0) {
                    ZStack {
                        Image("Mask\(chosen.chosenDragon.0)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.width * 0.089)
                        Image(gageVar.isTransform ? "ProfileFinal\(chosen.chosenDragon.0)" : "Profile\(chosen.chosenDragon.0)") // true 부분에 진화체 프로필 넣으면 됨
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.width * 0.055)
                            .offset(y: gageVar.isTransform ? UIScreen.height * 0.01 : 0)
                    }
                    Text("Lv.\(chosen.levelCount)")
                        .font(.cookierun(.regular, size: 20))
                        .foregroundColor(.white)
                }
                .offset(y: UIScreen.height * 0.04)

                HStack(spacing: 5) { // 녹색게이지칸스택
                    Image("carrot")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    Rectangle()
                        .frame(width: gageWidthIn, height: gageHeightIn)
                        .cornerRadius(6)
                        .foregroundColor(gageVar.turnGreen1 ? .vegiGreen : .white)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 2))
                    Rectangle().frame(width: gageWidthIn, height: gageHeightIn)
                        .cornerRadius(6)
                        .foregroundColor(gageVar.turnGreen2 ? .vegiGreen : .white)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 2))
                    Rectangle().frame(width: gageWidthIn, height: gageHeightIn)
                        .cornerRadius(6)
                        .foregroundColor(gageVar.turnGreen3 ? .vegiGreen : .white)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 2))
                } // Hstack
                .offset(y: statusYOffset)

                HStack(spacing: 5) { // 빨강 게이지 스택
                    Image("apple")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    Rectangle().frame(width: gageWidthIn, height: gageHeightIn)
                        .cornerRadius(6)
                        .foregroundColor(gageVar.turnRed1 ? .fruitRed : .white)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 2))
                    Rectangle().frame(width: gageWidthIn, height: gageHeightIn)
                        .cornerRadius(6)
                        .foregroundColor(gageVar.turnRed2 ? .fruitRed : .white)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 2))
                    Rectangle().frame(width: gageWidthIn, height: gageHeightIn)
                        .cornerRadius(6)
                        .foregroundColor(gageVar.turnRed3 ? .fruitRed : .white)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 2))
                } // Hstack
                .offset(y: statusYOffset)

                HStack(spacing: 5) { // 오렌지 게이지 스택
                    Image("meat")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    ZStack {
                        Rectangle().frame(width: gageWidthIn, height: gageHeightIn)
                            .cornerRadius(6)
                            .foregroundColor(gageVar.turnOrange1 ? .meatYellow : .white)
                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 2))
                    }
                    ZStack {
                        Rectangle().frame(width: gageWidthIn, height: gageHeightIn)
                            .cornerRadius(6)
                            .foregroundColor(gageVar.turnOrange2 ? .meatYellow : .white)
                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 2))
                    }
                    ZStack {
                        Rectangle().frame(width: gageWidthIn, height: gageHeightIn)
                            .cornerRadius(6)
                            .foregroundColor(gageVar.turnOrange3 ? .meatYellow : .white)
                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 2))
                    }
                } // Hstack
                .offset(y: statusYOffset)
            } // 각 게이지와 레벨 상태 표시 상태창 스택
        }.offset(x: UIScreen.width * -0.14)
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
            .environmentObject(gageVariables())
            .environmentObject(ChosenDragon())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
