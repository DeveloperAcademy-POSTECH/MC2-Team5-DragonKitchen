//
//  TasteView.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/09.
//

import SwiftUI

struct TasteView: View {
    @State var isOn: [Bool] = [true, false, false]
    @State var index: Int = 1
    var body: some View {
        ZStack {
            Image("tableBG2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
//                NavigationBar(page: 5,isCleared: .constant(true))
                HStack(spacing: 0) {
                    Image("raw")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.width * 0.33)
                        .offset(x: -UIScreen.width * 0.21, y: UIScreen.height * 0.023)
                        .opacity(isOn[0] ? 1 : 0.3)
                    Image("toast")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.width * 0.33)
                        .opacity(isOn[1] ? 1 : 0.3)
                    Image("fry")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.width * 0.33)
                        .offset(x: UIScreen.width * 0.21, y: UIScreen.height * 0.06)
                        .opacity(isOn[2] ? 1 : 0.3)
                }
                .offset(x: -UIScreen.width * 0.54 * (CGFloat(index) - 2))
                HStack {
                    RoundedButton(widthScale: 0.21, heightScale: 0.148, content: "생으로 주기", isActive: isOn[0])
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                isOn = [true, false, false]
                                index = 1
                            }
                        }
                    RoundedButton(widthScale: 0.21, heightScale: 0.148, content: "구워 주기", isActive: isOn[1])
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                isOn = [false, true, false]
                                index = 2
                            }
                        }
                    RoundedButton(widthScale: 0.21, heightScale: 0.148, content: "볶아 주기", isActive: isOn[2])
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                isOn = [false, false, true]
                                index = 3
                            }
                        }
                }
            }
            .ignoresSafeArea()
            .offset(y: UIScreen.height * 0.1)
        }
    }
}

struct TasteView_Previews: PreviewProvider {
    static var previews: some View {
        TasteView()
    }
}
