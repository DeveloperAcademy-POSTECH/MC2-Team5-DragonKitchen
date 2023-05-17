
//  MainView.swift
//  DinoDina
//
//  Created by 김기영 on 2023/05/03.
//

import NavigationStack
import SwiftUI

struct MainView: View {
    @EnvironmentObject var gageVar: gageVariables
    @EnvironmentObject var chosen: ChosenDragon
    @EnvironmentObject var navigate: NavigateModel
    @EnvironmentObject var sound: SoundEffect
    @ObservedObject var audioRecorder = AudioRecorder()
    @State var heartNum: Int = 0
    let heartXOffset: CGFloat = -120
    @State var isPresenting: Bool = false
    @State var isCameraPresenting: Bool = false
    @State var isClicked: Bool = false
    @State var timer: Timer?

    var body: some View {
        ZStack {
            Image("MainBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .onAppear {
                    if let recording = audioRecorder.recordingFile {
                        self.audioRecorder.deleteRecording(url: recording)
                    }
                }

            // 공룡터치시 하트나오는 ForEach
            ZStack {
                ForEach(0 ..< 2 * heartNum, id: \.self) { _ in
                    HeartImage(xOffset: -55, yOffset: -120, heartColor: .red)
                    HeartImage(xOffset: 15, yOffset: -140, heartColor: .fruitRed)
                    HeartImage(xOffset: 25, yOffset: -100, heartColor: .red)
                    HeartImage(xOffset: 10, yOffset: -90, heartColor: .fruitRed)
                }
//              공룡이미지 탭하는 경우 하트 뿅뿅
                Image("Standing\(chosen.chosenDragon.0)") // 킹룡짱룡 위치
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.width * 0.5)
                    .onTapGesture {
                        sound.heartEffect.play()
                        heartNum += 1
                    }
                    .shadow(color: .buttonColor, radius: gageVar.isEvolution ? 15 : 0)
                    .opacity(gageVar.isTransform ? 0 : 1)
                    .scaleEffect(gageVar.isTransform ? 0 : 1)
                    .animation(.easeOut.repeatCount(5), value: gageVar.isTransform)
                    .offset(y: UIScreen.height * 0.15)

                Image("Final\(chosen.chosenDragon.0)") // 킹룡짱룡 위치
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.width * 0.9)
                    .onTapGesture {
                        sound.evolHeartEffect.play()
                        heartNum += 1
                    }
                    .opacity(gageVar.isTransform ? 1 : 0)
                    .scaleEffect(gageVar.isTransform ? 1.1 : 0)
                    .animation(.easeOut.repeatCount(5), value: gageVar.isTransform)
                    .offset(x: UIScreen.width * -0.02, y: UIScreen.height * 0.1)
                if gageVar.isEvolution {
                    Button {
//                        sound.buttonEffect.play()
                        sound.evolEffect.play()
                        if gageVar.isEvolution {
                            gageVar.isTransform = true
                            gageVar.turnGreen1 = false
                            gageVar.turnGreen2 = false
                            gageVar.turnGreen3 = false
                            gageVar.turnRed1 = false
                            gageVar.turnRed2 = false
                            gageVar.turnRed3 = false
                            gageVar.turnOrange1 = false
                            gageVar.turnOrange2 = false
                            gageVar.turnOrange3 = false
                            gageVar.greenCount = 0
                            gageVar.redCount = 0
                            gageVar.orangeCount = 0
                            gageVar.isEvolution = false
                            chosen.levelCount += 1
                        }
                    } label: {
                        ZStack {
                            Color.buttonColor.cornerRadius(20)
                            RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 1).foregroundColor(.black)
                            Text("진화하기")
                                .font(.cookierun(.regular, size: 24))
                                .foregroundColor(.white)
                        }
                        .font(.cookierun(.regular))
                        .frame(width: UIScreen.width * 0.2, height: UIScreen.height * 0.13)
                        .shadow(radius: 5)
                        .opacity(gageVar.isTransform ? 0 : 1)
                    }
                    .offset(y: UIScreen.height * 0.38)
                }
            }
            VStack {
                Spacer().frame(height: UIScreen.height * 0.025)
                HStack {
                    StatusView(gageVar: _gageVar)
                        .offset(x: -UIScreen.width * 0.05)
                }
                Spacer().frame(height: UIScreen.height * 0.3)

                // 도감, 먹이 버튼 들어가는 스택
                HStack(alignment: .bottom) {
                    // 도감 이미지
                    PushView(destination: BookView()) {
                        ZStack {
                            if navigate.navigateBook {
                                Image("BookArrow")
                                    .offset(x: navigate.isArrowAnimating ? UIScreen.width * 0.075 : UIScreen.width * 0.07, y: navigate.isArrowAnimating ? -UIScreen.height * 0.23 : -UIScreen.height * 0.21)
                                    .animation(.linear(duration: 0.4).repeatForever(), value: navigate.isArrowAnimating)
                            }
                            Image("Book")
                            Text("도감")
                                .font(.cookierun(.regular))
                                .foregroundColor(.black)
                        }
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        sound.navEffect.play()
                        navigate.isArrowAnimating = false
                        navigate.navigateBook = false
                    })
                    Spacer()
                        .onAppear {
                            navigate.isArrowAnimating = true
                        }
                    // 먹이주는 곳
                    ZStack {
                        if navigate.navigateFood {
                            Image("NavigatingArrow")
                                .offset(x: navigate.isArrowAnimating ? -UIScreen.width * 0.07 : -UIScreen.width * 0.065, y: navigate.isArrowAnimating ? -UIScreen.height * 0.14 : -UIScreen.height * 0.13)
                                .animation(.linear(duration: 0.4).repeatForever(), value: navigate.isArrowAnimating)
                        }
                        FeedButton(isPresenting: $isPresenting, isClicked: $isClicked)
                            .padding(.bottom, UIScreen.height * 0.02)
                            .simultaneousGesture(TapGesture().onEnded {
                                sound.dishOpenEffect.play()
                            })
                    }
                }
                .padding(.horizontal, UIScreen.width * 0.03)
            }
            if isClicked {
                Color.black.opacity(0.2).ignoresSafeArea()
            }
        }
        .overlay {
            PopupView(isPresenting: $isPresenting, isClicked: $isClicked, classifier: ImageClassifier())
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().previewInterfaceOrientation(.landscapeRight)
            .environmentObject(ChosenFood())
            .environmentObject(gageVariables())
            .environmentObject(ChosenDragon())
            .environmentObject(NavigateModel())
    }
}
