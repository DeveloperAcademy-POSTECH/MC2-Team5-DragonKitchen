//
//  MainView.swift
//  DinoDina
//
//  Created by 김기영 on 2023/05/03.
//

import SwiftUI
import UIKit

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
    //진화할 때 카운트 값 리셋?
    @State var bubbleOn = false
    @State var vegeOn = false
    
    var body: some View {
        VStack{
            Spacer().frame(height: 20)
            HStack{
//                Circle().foregroundColor(.black)
//                    .frame(width: UIScreen.main.bounds.width * 0.05)
                ZStack{
                    Rectangle().frame(width: 250,height: 40)
                        .foregroundColor(.gray)
                        .cornerRadius(15)
                    HStack{
                        Rectangle().frame(width: 70,height: 25)
                            .foregroundColor(.green)
                            .cornerRadius(15)
                            .opacity(turnGreen1 ? 1 : 0)
                        Rectangle().frame(width: 70,height: 25)
                            .foregroundColor(.green)
                            .cornerRadius(15)
                            .opacity(turnGreen2 ? 1 : 0)
                        Rectangle().frame(width: 70,height: 25)
                            .foregroundColor(.green)
                            .cornerRadius(15)
                            .opacity(turnGreen3 ? 1 : 0)
                    }
                }
                
                ZStack{
                    Rectangle().frame(width: 250,height: 40)
                        .foregroundColor(.gray)
                        .cornerRadius(15)
                    HStack{
                        Rectangle().frame(width: 70,height: 25)
                            .foregroundColor(.red)
                            .cornerRadius(15)
                            .opacity(turnRed1 ? 1 : 0)
                        Rectangle().frame(width: 70,height: 25)
                            .foregroundColor(.red)
                            .cornerRadius(15)
                            .opacity(turnRed2 ? 1 : 0)
                        Rectangle().frame(width: 70,height: 25)
                            .foregroundColor(.red)
                            .cornerRadius(15)
                            .opacity(turnRed3 ? 1 : 0)
                    }
                }
                ZStack{
                    Rectangle().frame(width: 250,height: 40)
                        .foregroundColor(.gray)
                        .cornerRadius(15)
                    HStack{
                        Rectangle().frame(width: 70,height: 25)
                            .foregroundColor(.orange)
                            .cornerRadius(15)
                            .opacity(turnOrange1 ? 1 : 0)
                        Rectangle().frame(width: 70,height: 25)
                            .foregroundColor(.orange)
                            .cornerRadius(15)
                            .opacity(turnOrange2 ? 1 : 0)
                        Rectangle().frame(width: 70,height: 25)
                            .foregroundColor(.orange)
                            .cornerRadius(15)
                            .opacity(turnOrange3 ? 1 : 0)
                    }
                }

            }
            Spacer()
            HStack{
                VStack{                    Spacer().frame(height: 150)
                    Button{}label: {
                        Text("도감❤️")
                            .font(.system(size:30))
                    }
                    
                }
                Spacer().frame(width: 130)
                ZStack{
                    
                    
                    ZStack{
                        Image("Dino")//킹룡짱룡 위치
                        Image(systemName: "bubble.left")
                            .opacity(bubbleOn ? 1 : 0)
                            .animation(.default, value: bubbleOn)
                            .font(.system(size:100))
                            .offset(x:170,y:-130)
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
                                
//                                greenCount = 0
//                                turnGreen1 = false
//                                turnGreen2 = false
//                                turnGreen3 = false
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
//                                redCount = 0
//                                turnRed1 = false
//                                turnRed2 = false
//                                turnRed3 = false
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
//                                orangeCount = 0
//                                turnOrange1 = false
//                                turnOrange2 = false
//                                turnOrange3 = false
                            }
                        }label: {
                            Text("fruit Up")
                        }
                        .offset(x:-250)
                    }
                    
                    
                    
                    
                }
                Spacer().frame(width: 130)
                VStack{
                    
                    Spacer().frame(height: 150)
                    Button{}label: {
                        Text("먹이🤌")
                            .font(.system(size:30))
                    }
                }
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().previewInterfaceOrientation(.landscapeRight)
    }
}
