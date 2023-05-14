//
//  TasteView.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/09.
//

import SwiftUI

struct TasteView: View {
    @State var isOn: [Bool] = [true, false, false]
    @Binding var index: Int
    @Binding var isPopupActive: Bool
    @Binding var isDimmed: Bool
    @Binding var isCleared: Bool
    @EnvironmentObject var chosenDragon: ChosenDragon
    @EnvironmentObject var chosenFood: ChosenFood
    @Binding var foodInfo: [(imageName: String, recipe: String)]
    var body: some View {
        ZStack {
            Image("tableBG2")
                .resizable()
                .scaledToFill()
            VStack {
                HStack(spacing: 0) {
                    // 생으로 주기
                    Image(foodInfo[0].0)
                        .resizable()
                        .scaledToFit()
                        .offset(x: -UIScreen.width * 0.21)
                        .opacity(isOn[0] ? 1 : 0.3)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                isOn = [true, false, false]
                                index = 1
                            }
                        }
                    // 구워 주기
                    Image(foodInfo[1].0)
                        .resizable()
                        .scaledToFit()
                        .opacity(isOn[1] ? 1 : 0.3)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                isOn = [false, true, false]
                                index = 2
                            }
                        }
                    // 볶아 주기
                    Image(foodInfo[2].0)
                        .resizable()
                        .scaledToFit()
                        .offset(x: UIScreen.width * 0.21)
                        .opacity(isOn[2] ? 1 : 0.3)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                isOn = [false, false, true]
                                index = 3
                            }
                        }
                }
                .ignoresSafeArea()
                .offset(x: -UIScreen.width * 0.54 * (CGFloat(index) - 2))

                HStack {
                    RoundedButton(widthScale: 0.21, heightScale: 0.148, content: "\(foodInfo[0].1) 주기", isActive: isOn[0])
                        .onTapGesture {
                            chosenFood.cooking = .raw
                            withAnimation(.easeIn) {
                                isOn = [true, false, false]
                                index = 1
                            }
                        }
                    RoundedButton(widthScale: 0.21, heightScale: 0.148, content: "\(foodInfo[1].1) 주기", isActive: isOn[1])
                        .onTapGesture {
                            chosenFood.cooking = .toast
                            withAnimation(.easeIn) {
                                isOn = [false, true, false]
                                index = 2
                            }
                        }
                    RoundedButton(widthScale: 0.21, heightScale: 0.148, content: "\(foodInfo[2].1) 주기", isActive: isOn[2])
                        .onTapGesture {
                            chosenFood.cooking = .fry
                            withAnimation(.easeIn) {
                                isOn = [false, false, true]
                                index = 3
                            }
                        }
                }
            }
            .padding(.top, UIScreen.height * 0.25)
        }
        .gesture(
            DragGesture().onEnded { value in
                print("dragged!!")
                let direction = self.detectDirection(value: value)
                if direction == .left {
                    print("left dragged")
                    withAnimation(.easeIn) {
                        if !(index == 1) {
                            index -= 1
                        }
                        switch index {
                        case 1: isOn = [true, false, false]
                        case 2: isOn = [false, true, false]
                        default: break
                        }
                    }
                }
                if direction == .right {
                    print("right  dragged")

                    withAnimation(.easeIn) {
                        if !(index == 3) {
                            index += 1
                        }
                        switch index {
                        case 2: isOn = [false, true, false]
                        case 3: isOn = [false, false, true]
                        default: break
                        }
                    }
                }
            }
        )
        .onAppear {
            foodInfo = foodInfo.map { (imageName: chosenFood.chosenFood.0 + $0.imageName, recipe: $0.recipe) }
            isCleared = true
        }
        .ignoresSafeArea()
    }

    enum SwipeHVDirection: String {
        case left, right, up, down, none
    }

    func detectDirection(value: DragGesture.Value) -> SwipeHVDirection {
        if value.startLocation.x < value.location.x - 24 {
            return .left
        }
        if value.startLocation.x > value.location.x + 24 {
            return .right
        }
        if value.startLocation.y < value.location.y - 24 {
            return .down
        }
        if value.startLocation.y > value.location.y + 24 {
            return .up
        }
        return .none
    }
}

struct TasteView_Previews: PreviewProvider {
    static var previews: some View {
        TasteView(index: .constant(1), isPopupActive: .constant(false), isDimmed: .constant(false), isCleared: .constant(true), foodInfo: .constant([("", "")]))
            .environmentObject(ChosenDragon())
            .environmentObject(ChosenFood())
    }
}
