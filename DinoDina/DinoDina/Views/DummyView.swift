//
//  DummyView.swift
//  DinoDina
//
//  Created by 김기영 on 2023/05/08.
//

import SwiftUI

struct DummyView: View {
    @StateObject var gageVar = gageVariables()
 
    @State var bubbleOn = false
    @State var vegeOn = false
    @State var gageWidthOut: CGFloat = UIScreen.width * 0.025
    @State var gageWidthIn: CGFloat = UIScreen.width * 0.02
    @State var gageHeightOut: CGFloat = UIScreen.width * 0.025
    @State var gageHeightIn: CGFloat = UIScreen.width * 0.02

    var body: some View {
        VStack{
            Text("Green gage Count is \(gageVar.greenCount)")
            Text("Red gage Count is \(gageVar.redCount)")
            Text("Orange gage Count is \(gageVar.orangeCount)")
            GreenButtonView()
                .environmentObject(gageVar)
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
                    
                    Spacer().frame(width: UIScreen.width * 0.35)
                } // 각 게이지와 레벨 상태 표시 상태창 스택
            }
        }
    }
}

struct GreenButtonView: View{
    @EnvironmentObject var gageVar : gageVariables
    var body: some View{
        Button{
            gageVar.greenCount += 1
            switch gageVar.greenCount {
            case 1: gageVar.turnGreen1 = true
            case 2: gageVar.turnGreen2 = true
            case 3: gageVar.turnGreen3 = true
            default:
                gageVar.greenCount = 3
//                                bubbleOn = true
//                                vegeOn = true
//                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
//                                    bubbleOn = false
//                                    vegeOn = false
//            }
        }
    } label: {
        ZStack{
            
            RoundedButton(widthScale: 0.15, heightScale: 0.1)
            Text("Green Up!")
                .foregroundColor(.white)
        }
    }
        Button{
            gageVar.redCount += 1
            switch gageVar.redCount {
            case 1: gageVar.turnRed1 = true
            case 2: gageVar.turnRed2 = true
            case 3: gageVar.turnRed3 = true
            default:
                gageVar.redCount = 3
//                                bubbleOn = true
//                                vegeOn = true
//                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
//                                    bubbleOn = false
//                                    vegeOn = false
//            }
        }
    } label: {
        ZStack{
            
            RoundedButton(widthScale: 0.15, heightScale: 0.1)
            Text("Red Up!")
                .foregroundColor(.white)
        }
    }
        Button{
            gageVar.orangeCount += 1
            switch gageVar.orangeCount {
            case 1: gageVar.turnOrange1 = true
            case 2: gageVar.turnOrange2 = true
            case 3: gageVar.turnOrange3 = true
            default:
                gageVar.orangeCount = 3
//                                bubbleOn = true
//                                vegeOn = true
//                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
//                                    bubbleOn = false
//                                    vegeOn = false
//            }
        }
    } label: {
        ZStack{
            
            RoundedButton(widthScale: 0.15, heightScale: 0.1)
            Text("Orange Up!")
                .foregroundColor(.white)
        }
    }
        }
    }


struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView()
    }
}
