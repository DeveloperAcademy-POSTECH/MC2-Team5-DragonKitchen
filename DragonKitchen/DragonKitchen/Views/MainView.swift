
//  MainView.swift
//  DinoDina
//
//  Created by 김기영 on 2023/05/03.
//

import NavigationStack
import SwiftUI

struct MainView: View {
    @EnvironmentObject var gageVar : gageVariables

    

    @State var heartNum: Int = 0
    let heartXOffset: CGFloat = -120
    @State var isTransform: Bool = false
    @State var isPresenting: Bool = false
    @State var isCameraPresenting: Bool = false

    var body: some View {
        NavigationStackView(transitionType: .none) {
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    Spacer().frame(height: UIScreen.height * 0.025)
                    HStack{
                        StatusView(gageVar: _gageVar)
                            .offset(x: UIScreen.width * 0.13)
                        Button{
                            if gageVar.isEvolution {
                                
                                isTransform = true
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
                                
                          
                            }
                            else {
                                
                            }
                        } label: {
                            RoundedButton(widthScale: 0.1, heightScale: 0.08, content: "진화", contentSize: 15, contentColor: .white, isActive: gageVar.isEvolution )
                        }
                       
                        Spacer().frame(width: UIScreen.width * 0.25)
                    }
                    PushView(destination:GageButton()){
                        Text("test")
                    }
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
                                ForEach(0 ..< 1 * heartNum, id: \.self) { _ in
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .foregroundColor(.red)
                                        .frame(width: 30, height: 30)
                                        .offset(x: 65 + heartXOffset, y: -130)
                                        .modifier(HeartModifier())
                                        .padding()
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .foregroundColor(.red)
                                        .frame(width: 30, height: 30)
                                        .offset(x: 120 + heartXOffset, y: -150)
                                        .modifier(HeartModifier())
                                        .padding()
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .foregroundColor(.red)
                                        .frame(width: 30, height: 30)
                                        .offset(x: 135 + heartXOffset, y: -110)
                                        .modifier(HeartModifier())
                                        .padding()
                                    Image(systemName: "heart.fill")
                                        .resizable()
                                        .foregroundColor(.red)
                                        .frame(width: 30, height: 30)
                                        .offset(x: 125 + heartXOffset, y: -100)
                                        .modifier(HeartModifier())
                                        .padding()
//                                    Image(systemName: "heart.fill")
//                                        .resizable()
//                                        .foregroundColor(.red)
//                                        .frame(width: 30, height: 30)
//                                        .offset(x: 105 + moveHeart, y: -110)
//                                        .modifier(HeartModifier())
//                                        .padding()
                                }
                                // 공룡이미지 탭하는 경우 하트 뿅뿅
                                Image("StandingPlu") // 킹룡짱룡 위치
                                    .resizable()
                                    .scaledToFit()
                                    ////                                    .minimumScaleFactor(0.1)
                                    .onTapGesture {
                                        heartNum += 1
                                    }
                                    .shadow(color:.buttonColor ,radius:gageVar.isEvolution ? 15 : 0)
                                    .opacity(isTransform ? 0 : 1)
                                    .scaleEffect(isTransform ? 0 : 1)
                                    .animation(.easeOut.repeatCount(5), value: isTransform)
                                Image("StandingHiel") // 킹룡짱룡 위치
                                    .resizable()
                                    .scaledToFit()
                                    ////                                    .minimumScaleFactor(0.1)
                                    .onTapGesture {
                                        heartNum += 1
                                    }
                                    .opacity(isTransform ? 1 : 0)
                                    .scaleEffect(isTransform ? 1 : 0)
                                    .animation(.easeOut.repeatCount(5), value: isTransform)
                                
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
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().previewInterfaceOrientation(.landscapeRight)
            .environmentObject(ChosenFood())
            .environmentObject(gageVariables())
    }
}
