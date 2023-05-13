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
    @State var isPopupActive = false
    @State var isDimmed = false
    @EnvironmentObject var chosenDragon: ChosenDragon
    @EnvironmentObject var chosenFood: ChosenFood
    @State var foodInfo: [(imageName: String, recipe: String)] = [("_raw", "생으로"), ("_toast", "구워"), ("_fry", "볶아")]
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
                        .gesture(DragGesture()
                            .onEnded { value in
                                print("value ", value.translation.width)
                                let direction = self.detectDirection(value: value)
                                if direction == .right {
                                    withAnimation(.easeIn) {
                                        isOn = [false, true, false]
                                        index = 2
                                    }
                                }
                            }
                        )
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
                        .gesture(DragGesture()
                            .onEnded { value in
                                print("value ", value.translation.width)
                                let direction = self.detectDirection(value: value)
                                if direction == .right {
                                    withAnimation(.easeIn) {
                                        isOn = [false, false, true]
                                        index = 3
                                    }
                                }
                                if direction == .left {
                                    withAnimation(.easeIn) {
                                        isOn = [true, false, false]
                                        index = 1
                                    }
                                }
                            }
                        )
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
                        .gesture(DragGesture()
                            .onEnded { value in
                                print("value ", value.translation.width)
                                let direction = self.detectDirection(value: value)
                                if direction == .left {
                                    withAnimation(.easeIn) {
                                        isOn = [false, true, false]
                                        index = 2
                                    }
                                }
                            }
                        )
                }
                .ignoresSafeArea()
                .offset(x: -UIScreen.width * 0.54 * (CGFloat(index) - 2))
                HStack {
                    RoundedButton(widthScale: 0.21, heightScale: 0.148, content: "\(foodInfo[0].1) 주기", isActive: isOn[0])
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                isOn = [true, false, false]
                                index = 1
                            }
                        }
                    RoundedButton(widthScale: 0.21, heightScale: 0.148, content: "\(foodInfo[1].1) 주기", isActive: isOn[1])
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                isOn = [false, true, false]
                                index = 2
                            }
                        }
                    RoundedButton(widthScale: 0.21, heightScale: 0.148, content: "\(foodInfo[2].1) 주기", isActive: isOn[2])
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                isOn = [false, false, true]
                                index = 3
                            }
                        }
                }
                Text("Tap to activate camera")
                    .onTapGesture {
                        isDimmed = true
                        withAnimation(.linear(duration: 0.3)) {
                            isPopupActive = true
                        }
                    }
            }
            .padding(.top, UIScreen.height*0.25)
            Color.black
                .opacity(isDimmed ? 0.3 : 0)
        }
        .onAppear {
            foodInfo = foodInfo.map { (imageName: chosenFood.chosenFood.0 + $0.imageName, recipe: $0.recipe) }
        }
        .ignoresSafeArea()
        .overlay {
            ZStack {
                ZStack {
                    Color.white.cornerRadius(20)
                    RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2.0)
                    VStack(alignment: .center, spacing: 0) {
                        Text("\(chosenDragon.chosenDragon.1)에게 \(foodInfo[index - 1].1)를 주고\n함께 사진을 찍어볼까요?")
                            .multilineTextAlignment(.center)
                            .font(.cookierun(.regular))
                            .padding(.top)
                        Image(foodInfo[index - 1].0)
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(0.65)
                    }
                    .padding(.vertical, 15)
                }
                .frame(width: UIScreen.width * 0.6, height: UIScreen.height * 0.76)
                .padding(.top, isPopupActive ? 0 : UIScreen.height * 3)

                Image(systemName: "xmark")
                    .font(.system(size: 28, weight: .ultraLight))
                    .padding(.leading, UIScreen.width * 0.53)
                    .padding(.top, isPopupActive ? -UIScreen.height * 0.35 : UIScreen.height * 3)
                    .foregroundColor(Color(red: 153 / 255, green: 153 / 255, blue: 153 / 255))
                    .onTapGesture {
                        isDimmed = false
                        withAnimation(.easeIn(duration: 0.3)) {
                            isPopupActive = false
                        }
                    }
                ZStack {
                    RoundedButton(widthScale: 0.3, heightScale: 0.148, content: "좋아요!", contentSize: 25, contentColor: .buttonTextColor, isActive: true)
                }
                //                    .onTapGesture {
                //                        isCameraPresenting = true
                //                    }
                .padding(.top, isPopupActive ? UIScreen.height * 0.75 : UIScreen.height * 3)
            }.zIndex(1000)
                .foregroundColor(.black)
        }
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
        TasteView()
            .environmentObject(ChosenDragon())
            .environmentObject(ChosenFood())
    }
}
