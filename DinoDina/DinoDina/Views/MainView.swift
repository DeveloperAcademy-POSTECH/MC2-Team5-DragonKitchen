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
   
    
    // 말풍선 on/off
    @State var bubbleOn = false
    @State var vegeOn = false
    @State var meatOn = false
    @State var fruitOn = false
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
        NavigationStackView(transitionType: .none) {
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    Spacer().frame(height: UIScreen.height * 0.025)
//                    StatusView(gageVar: gageVar)
                    ZStack{
                        Rectangle()
                            .frame(width: UIScreen.width * 0.5, height: UIScreen.height * 0.13)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .opacity(0.5)
                            .offset(x:UIScreen.width * -0.14)
                        HStack {
                            
                            
                            Circle().foregroundColor(.gray)
                                .frame(width: UIScreen.width * 0.08)
                                .overlay(Circle().stroke())
                            
                            VStack { // 음식 대표 이미지와 게이지를 쌓는 스택
                                
                                
                                HStack(spacing: 3) { // 녹색게이지칸스택
                                    Image(systemName: "carrot")
                                        .font(.system(size: 30))
                                    ZStack {
                                        
                                        Rectangle().frame(width: gageWidthOut, height: gageHeightOut)
            //                                            .foregroundColor(.vegiGreen)
                                            .cornerRadius(8)
                                        Rectangle().frame(width: gageWidthIn, height: gageHeightIn)
                                        
                                            .cornerRadius(6)
                                            .foregroundColor(gageVar.turnGreen1 ? .vegiGreen : .white)
                                    }
                                    ZStack {
                                        
                                        Rectangle().frame(width: gageWidthOut, height: gageHeightOut)
            //                                            .foregroundColor(.vegiGreen)
                                            .cornerRadius(8)
                                        Rectangle().frame(width: gageWidthIn, height: gageHeightIn)
                                        
                                            .cornerRadius(6)
                                            .foregroundColor(gageVar.turnGreen2 ? .vegiGreen : .white)
                                    }
                                    ZStack {
                                        
                                        Rectangle().frame(width: gageWidthOut, height: gageHeightOut)
            //                                            .foregroundColor(.vegiGreen)
                                            .cornerRadius(8)
                                        Rectangle().frame(width: gageWidthIn, height: gageHeightIn)
                                        
                                            .cornerRadius(6)
                                            .foregroundColor(gageVar.turnGreen3 ? .vegiGreen : .white)
                                    }
                                } // Hstack
                            } // vstack
                            
                            VStack {
                                
                                HStack(spacing: 3) { // 빨강 게이지 스택
                                    Image(systemName: "hare")
                                        .font(.system(size: 30))
                                    ZStack {
                                        
                                        Rectangle().frame(width: gageWidthOut, height: gageHeightOut)
            //                                            .foregroundColor(.fruitRed)
                                            .cornerRadius(8)
                                        Rectangle().frame(width: gageWidthIn, height: gageHeightIn)
                                        
                                            .cornerRadius(6)
                                            .foregroundColor(gageVar.turnRed1 ? .fruitRed : .white)
                                    }
                                    ZStack {
                                        
                                        Rectangle().frame(width: gageWidthOut, height: gageHeightOut)
            //                                            .foregroundColor(.fruitRed)
                                            .cornerRadius(8)
                                        Rectangle().frame(width: gageWidthIn, height: gageHeightIn)
                                        
                                            .cornerRadius(6)
                                            .foregroundColor(gageVar.turnRed2 ? .fruitRed : .white)
                                    }
                                    ZStack {
                                        
                                        Rectangle().frame(width: gageWidthOut, height: gageHeightOut)
            //                                            .foregroundColor(.fruitRed)
                                            .cornerRadius(8)
                                        Rectangle().frame(width: gageWidthIn, height: gageHeightIn)
                                        
                                            .cornerRadius(6)
                                            .foregroundColor(gageVar.turnRed3 ? .fruitRed : .white)
                                    }
                                    
                                } // Hstack
                            } // vstack
                            
                            VStack {
                                
                                
                                HStack(spacing: 3) { // 오렌지 게이지 스택
                                    Image(systemName: "fish")
                                        .font(.system(size: 30))
                                    ZStack {
                                        
                                        Rectangle().frame(width: gageWidthOut, height: gageHeightOut)
            //                                            .foregroundColor(.meatYellow)
                                            .cornerRadius(8)
                                        Rectangle().frame(width: gageWidthIn, height: gageHeightIn)
                                        
                                            .cornerRadius(6)
                                            .foregroundColor(gageVar.turnOrange1 ? .meatYellow : .white)
                                    }
                                    ZStack {
                                        
                                        Rectangle().frame(width: gageWidthOut, height: gageHeightOut)
            //                                            .foregroundColor(.meatYellow)
                                            .cornerRadius(8)
                                        Rectangle().frame(width: gageWidthIn, height: gageHeightIn)
                                        
                                            .cornerRadius(6)
                                            .foregroundColor(gageVar.turnOrange2 ? .meatYellow : .white)
                                    }
                                    ZStack {
                                        
                                        Rectangle().frame(width: gageWidthOut, height: gageHeightOut)
            //                                            .foregroundColor(.meatYellow)
                                            .cornerRadius(8)
                                        Rectangle().frame(width: gageWidthIn, height: gageHeightIn)
                                        
                                            .cornerRadius(6)
                                            .foregroundColor(gageVar.turnOrange3 ? .meatYellow : .white)
                                    }
                                   
                                } // Hstack
                                
                            } // vstack
                            
                            Spacer().frame(width: UIScreen.width * 0.35)
                        } // 각 게이지와 레벨 상태 표시 상태창 스택
                    }
                    
//                    NavigationView{
//                        NavigationLink(destination:DummyView(gageVar: gageVar)){
//                            Text("dd")
//                        }
//                    }
                    PushView(destination: DummyView(gageVar: gageVar)){
                        Text("dd")
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
                                Image("StandingDino") // 킹룡짱룡 위치
                                    .resizable()
                                    .scaledToFit()
////                                    .minimumScaleFactor(0.1)
                                    .onTapGesture {
                                        heartNum += 1
                                    }
                                // 공룡이 먹고싶은 음식 말풍선
                                Image("Bubble")
                                    .opacity(bubbleOn ? 1 : 0)
                                    .animation(.default, value: bubbleOn)
                                    .offset(x: 170, y: -130)
                                // 공룡이 먹고싶은 음식 이미지
                                Image(systemName: "leaf")
                                    .opacity(vegeOn ? 1 : 0)
                                    .animation(.default, value: vegeOn)
                                    .font(.system(size: 50))
                                    .offset(x: 170, y: -140)
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
