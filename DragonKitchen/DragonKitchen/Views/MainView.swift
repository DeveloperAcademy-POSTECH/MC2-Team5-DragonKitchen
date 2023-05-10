//
//  MainView.swift
//  DinoDina
//
//  Created by 김기영 on 2023/05/03.
//

import NavigationStack
import SwiftUI

struct MainView: View {
    @EnvironmentObject var gageVar : gageVariables

    // 하트뿅뿅
    @State var heartBB = false
    @State var heartNum: Int = 0
    let moveHeart: CGFloat = -120
    let gageWidthOut: CGFloat = UIScreen.width * 0.025
    let gageWidthIn: CGFloat = UIScreen.width * 0.02
    let gageHeightOut: CGFloat = UIScreen.width * 0.025
    let gageHeightIn: CGFloat = UIScreen.width * 0.02

    @State var isPresenting: Bool = false
    @State var isCameraPresenting: Bool = false

    var body: some View {
//        NavigationStackView(transitionType: .none) {
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    Spacer().frame(height: UIScreen.height * 0.025)
                    StatusView(gageVar: _gageVar)
                    Spacer() // 상태창과 도감공룡먹이 스택 사이 공간

                    HStack {
                        // 도감 이미지
                        VStack {
                            Spacer().frame(height: UIScreen.height * 0.1)
                            Button {} label: {
                                Image("Book")
//                                    .font(.system(size: 30))
                            }
                        }

                        Spacer().frame(width: UIScreen.width*0.04)

                        ZStack {
                            // 공룡터치시 하트나오는 ForEach
                            ZStack {
                                ForEach(0 ..< 2 * heartNum, id: \.self) { _ in
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .foregroundColor(.red)
                                        .frame(width: 30, height: 30)
                                        .offset(x: 65 + moveHeart, y: -130)
                                        .modifier(HeartModifier())
                                        .padding()
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .foregroundColor(.red)
                                        .frame(width: 30, height: 30)
                                        .offset(x: 120 + moveHeart, y: -150)
                                        .modifier(HeartModifier())
                                        .padding()
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .foregroundColor(.red)
                                        .frame(width: 30, height: 30)
                                        .offset(x: 135 + moveHeart, y: -110)
                                        .modifier(HeartModifier())
                                        .padding()
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .foregroundColor(.red)
                                        .frame(width: 30, height: 30)
                                        .offset(x: 125 + moveHeart, y: -100)
                                        .modifier(HeartModifier())
                                        .padding()
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .foregroundColor(.red)
                                        .frame(width: 30, height: 30)
                                        .offset(x: 105 + moveHeart, y: -110)
                                        .modifier(HeartModifier())
                                        .padding()
                                }
                                // 공룡이미지 탭하는 경우 하트 뿅뿅
                                Image("StandingPlu") // 킹룡짱룡 위치
                                    .resizable()
                                    .scaledToFit()
                                    ////                                    .minimumScaleFactor(0.1)
                                    .onTapGesture {
                                        heartNum += 1
                                    }
                            }


                        }
                        Spacer().frame(width: UIScreen.width*0.04)
                        // 먹이주는 곳
                        FeedButton(isPresenting: $isPresenting)
                    } // 도감, 공룡, 먹이 내용 들어가는 스택
                }
                .overlay {
                    PopupView(isPresenting: $isPresenting, classifier: ImageClassifier())
                }
            }
        }
    }


struct HeartEffect: GeometryEffect {
    var time: Double
    var speed = Double.random(in: 100 ... 200)
    var xDirection = Double.random(in: -0.1 ... 0.2)
    var yDirection = Double.random(in: -Double.pi ... 0)

    var animatableData: Double {
        get { time }
        set { time = newValue }
    }

    func effectValue(size _: CGSize) -> ProjectionTransform {
        let xTranslation = speed * xDirection
        let yTranslation = speed * sin(yDirection) * time
        let affineTranslation = CGAffineTransform(translationX: xTranslation, y: yTranslation)
        return ProjectionTransform(affineTranslation)
    }
} // 하트 움직임

struct HeartModifier: ViewModifier {
    @State var time = 0.0
    let duration = 1.0

    func body(content: Content) -> some View {
        ZStack {
            content
                .foregroundColor(.red)
                .modifier(HeartEffect(time: time))
                .opacity(time == 1 ? 0 : 1)
        }
        .onAppear {
            withAnimation(.easeOut(duration: duration)) {
                self.time = duration
            }
        }
    }
} // 하트 움직임 Viewmodifier

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().previewInterfaceOrientation(.landscapeRight)
            .environmentObject(ChosenFood())
            .environmentObject(gageVariables())
    }
}
