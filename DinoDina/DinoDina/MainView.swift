//
//  MainView.swift
//  DinoDina
//
//  Created by 김기영 on 2023/05/03.
//

import SwiftUI


struct MainView: View {
    //색깔별로 게이지 하나씩, 카운트 값에 따라 생성
    @State var turnGreen1 = false
    @State var turnGreen2 = false
    @State var turnGreen3 = false
    @State var greenCount:Int = 0
    
    @State var turnRed1 = false
    @State var turnRed2 = false
    @State var turnRed3 = false
    @State var redCount:Int = 0
    
    @State var turnOrange1 = false
    @State var turnOrange2 = false
    @State var turnOrange3 = false
    @State var orangeCount:Int = 0
    //진화할 때 카운트 값 리셋
    //말풍선 on/off
    @State var bubbleOn = false
    @State var vegeOn = false
    //하트뿅뿅
    @State var heartBB = false
    @State var heartNum:Int = 0
    @State var moveHeart:CGFloat = -80
    var body: some View {
        
        VStack{
            Spacer().frame(height: 20)
            
            HStack{
                Circle().foregroundColor(.clear)
                    .frame(width: UIScreen.width * 0.08)
                    .overlay(Circle().stroke())
                
                VStack{ //음식 대표 이미지와 게이지를 쌓는 스택
                    Image(systemName: "carrot")
                        .font(.system(size: 30))
                    
                    HStack(spacing:3){ //녹색게이지칸스택
                        ZStack{
                            Rectangle().frame(width: UIScreen.width * 0.038, height: UIScreen.height * 0.05)
                                .foregroundColor(.green)
                                .cornerRadius(15)
                            Rectangle().frame(width: UIScreen.width * 0.035, height: UIScreen.height * 0.04)
                                
                                .cornerRadius(15)
                                .foregroundColor(turnGreen1 ? .green : .white)
                        }
                        ZStack{
                                Rectangle().frame(width: UIScreen.width * 0.038, height: UIScreen.height * 0.05)
                                .foregroundColor(.green)
                                .cornerRadius(15)
                            Rectangle().frame(width: UIScreen.width * 0.035, height: UIScreen.height * 0.04)
                                
                                .cornerRadius(15)
                                .foregroundColor(turnGreen2 ? .green : .white)
                        }
                        ZStack{
                                    Rectangle().frame(width: UIScreen.width * 0.038, height: UIScreen.height * 0.05)
                                .foregroundColor(.green)
                                .cornerRadius(15)
                            Rectangle().frame(width: UIScreen.width * 0.035, height: UIScreen.height * 0.04)
                                
                                .cornerRadius(15)
                                .foregroundColor(turnGreen3 ? .green : .white)
                        }
                    } //Hstack
                } //vstack

                VStack{
                    Image(systemName: "carrot")
                        .font(.system(size: 30))
                    HStack(spacing:3){ //빨강 게이지 스택
                        ZStack{
                            Rectangle().frame(width: UIScreen.width * 0.038, height: UIScreen.height * 0.05)
                                .foregroundColor(.red)
                                .cornerRadius(15)
                            Rectangle().frame(width: UIScreen.width * 0.035, height: UIScreen.height * 0.04)
                                
                                .cornerRadius(15)
                                .foregroundColor(turnRed1 ? .red : .white)
                        }
                        ZStack{
                                Rectangle().frame(width: UIScreen.width * 0.038, height: UIScreen.height * 0.05)
                                .foregroundColor(.red)
                                .cornerRadius(15)
                            Rectangle().frame(width: UIScreen.width * 0.035, height: UIScreen.height * 0.04)
                                
                                .cornerRadius(15)
                                .foregroundColor(turnRed2 ? .red : .white)
                        }
                        ZStack{
                                    Rectangle().frame(width: UIScreen.width * 0.038, height: UIScreen.height * 0.05)
                                .foregroundColor(.red)
                                .cornerRadius(15)
                            Rectangle().frame(width: UIScreen.width * 0.035, height: UIScreen.height * 0.04)
                                
                                .cornerRadius(15)
                                .foregroundColor(turnRed3 ? .red : .white)
                        }//zstack
                    } //Hstack
                } //vstack
                
                VStack{
                    Image(systemName: "carrot")
                        .font(.system(size: 30))
                    
                    HStack(spacing:3){ //오렌지 게이지 스택
                        ZStack{
                            Rectangle().frame(width: UIScreen.width * 0.038, height: UIScreen.height * 0.05)
                                .foregroundColor(.orange)
                                .cornerRadius(15)
                            Rectangle().frame(width: UIScreen.width * 0.035, height: UIScreen.height * 0.04)
                                
                                .cornerRadius(15)
                                .foregroundColor(turnOrange1 ? .orange : .white)
                        }
                        ZStack{
                                Rectangle().frame(width: UIScreen.width * 0.038, height: UIScreen.height * 0.05)
                                .foregroundColor(.orange)
                                .cornerRadius(15)
                            Rectangle().frame(width: UIScreen.width * 0.035, height: UIScreen.height * 0.04)
                                
                                .cornerRadius(15)
                                .foregroundColor(turnOrange2 ? .orange : .white)
                        }
                        ZStack{
                                    Rectangle().frame(width: UIScreen.width * 0.038, height: UIScreen.height * 0.05)
                                .foregroundColor(.orange)
                                .cornerRadius(15)
                            Rectangle().frame(width: UIScreen.width * 0.035, height: UIScreen.height * 0.04)
                                
                                .cornerRadius(15)
                                .foregroundColor(turnOrange3 ? .orange : .white)
                        }
                    } //Hstack
                } //vstack
            
                Spacer().frame(width: UIScreen.width * 0.45)
            } //각 게이지와 레벨 상태 표시 상태창 스택
            
            Spacer() //상태창과 도감공룡먹이 스택 사이 공간
            
            
            HStack{
                //도감 이미지
                VStack{
                    Spacer().frame(height: 150)
                    Button{}label: {
                        Text("도감❤️")
                            .font(.system(size:30))
                    }
                    
                }
                
                Spacer().frame(width: 130)
                
                ZStack{
                    //공룡터치시 하트나오는 ForEach
                    ZStack{
                        ForEach(0 ..< 2 * heartNum, id: \.self){ _ in
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
                    //공룡이미지 탭하는 경우 하트 뿅뿅
                        Image("Dino")//킹룡짱룡 위치
                            .onTapGesture {
                                heartNum += 1
                            }
                        //공룡이 먹고싶은 음식 말풍선
                        Image(systemName: "bubble.left")
                            .opacity(bubbleOn ? 1 : 0)
                            .animation(.default, value: bubbleOn)
                            .font(.system(size:100))
                            .offset(x:170,y:-130)
                        //공룡이 먹고싶은 음식 이미지
                        Image(systemName: "leaf")
                            .opacity(vegeOn ? 1 : 0)
                            .animation(.default, value: vegeOn)
                            .font(.system(size:50))
                            .offset(x:170,y:-140)
                    }
                    
                    
                    
                    //더미버튼(실험용)
                    VStack{
                        Button{
                            greenCount += 1
                            switch greenCount {
                            case 1: turnGreen1 = true
                            case 2: turnGreen2 = true
                            case 3: turnGreen3 = true
                            default :
                                
                                bubbleOn = true
                                vegeOn = true
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5){
                                    bubbleOn = false
                                    vegeOn = false
                                }
                                
                          
                            }
                        }label: {
                            Text("vegetable Up")
                        }
                        .offset(x:-250)
                        Button{
                            redCount += 1
                            switch redCount {
                            case 1: turnRed1 = true
                            case 2: turnRed2 = true
                            case 3: turnRed3 = true
                            default :
                                bubbleOn = true
                                vegeOn = true
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5){
                                    bubbleOn = false
                                    vegeOn = false
                                }
                              
                            }
                        }label: {
                            Text("meat Up")
                        }
                        .offset(x:-250)
                        Button{
                            orangeCount += 1
                            switch orangeCount {
                            case 1: turnOrange1 = true
                            case 2: turnOrange2 = true
                            case 3: turnOrange3 = true
                            default :
                                bubbleOn = true
                                vegeOn = true
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5){
                                    bubbleOn = false
                                    vegeOn = false
                                }
                               
                            }
                        }label: {
                            Text("fruit Up")
                        }
                        .offset(x:-250)
                    }
                    
                    
                    
                    
                }
                Spacer().frame(width: 130)
                //먹이주는 곳
                VStack{
                    Spacer().frame(height: 150)
                    Button{
                    }label: {
                        Text("먹이🤌")
                            .font(.system(size:30))
                    }
                }
            }//도감, 공룡, 먹이 내용 들어가는 스택
            
        }
    }
}

struct HeartEffect : GeometryEffect {
    var time : Double
    var speed = Double.random(in: 100...200)
    var xDirection = Double.random(in: -0.1 ... 0.2)
    var yDirection = Double.random(in: -Double.pi ... 0)
    
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation = speed * xDirection
        let yTranslation = speed * sin(yDirection) *  time
        let affineTranslation = CGAffineTransform(translationX: xTranslation, y: yTranslation)
        return ProjectionTransform(affineTranslation)
    }
} //하트 움직임

struct HeartModifier: ViewModifier {
    @State var time = 0.0
    let duration = 1.0
    
    func body(content: Content) -> some View {
        ZStack{
            content
                .foregroundColor(.red)
                .modifier(HeartEffect(time: time))
                .opacity(time == 1 ? 0 : 1)
        }
        .onAppear {
            withAnimation(.easeOut(duration: duration)){
                self.time = duration
            }
                          
            }
        }
    } //하트 움직임 Viewmodifier


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().previewInterfaceOrientation(.landscapeRight)
    }
}
