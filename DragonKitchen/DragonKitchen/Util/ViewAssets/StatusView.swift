
//  StatusView.swift
//  DinoDina
//
//  Created by 김기영 on 2023/05/08.
//

import SwiftUI


struct StatusView: View {
    @EnvironmentObject var gageVar: gageVariables
    @EnvironmentObject var chosen: ChosenDragon

    @State var gageWidthOut: CGFloat = UIScreen.width * 0.028
    @State var gageWidthIn: CGFloat = UIScreen.width * 0.025
    @State var gageHeightOut: CGFloat = UIScreen.width * 0.028
    @State var gageHeightIn: CGFloat = UIScreen.width * 0.025

   
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: UIScreen.width * 0.5, height: UIScreen.height * 0.13)
                .foregroundColor(.white)
                .cornerRadius(15)
                .opacity(0.5)
                .offset(x:UIScreen.width * 0.02)
            HStack {
                VStack{
                    ZStack{
                        Image("MaskHiel")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.width * 0.089)
                        Image("ProfileHiel")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.width * 0.055)
                    }
                    
                        
                        
                        
                    
                    Text("Lv.1")
                }.offset(y:UIScreen.height * 0.04)
                    

                VStack { // 음식 대표 이미지와 게이지를 쌓는 스택
                    HStack(spacing: 5) { // 녹색게이지칸스택
//                        Image(systemName: "carrot")
                        Text("🥕")
                            .font(.system(size: 25))
                        
//                            Rectangle().frame(width: gageWidthOut, height: gageHeightOut)
//                                .foregroundColor(.black)
////                                            .foregroundColor(.vegiGreen)
//                                .cornerRadius(8)
                            Rectangle()
                                .frame(width: gageWidthIn, height: gageHeightIn)
                                .cornerRadius(6)
                                .foregroundColor(gageVar.turnGreen1 ? .vegiGreen : .white)

                                .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 2))
                                
                        
                        
//                            Rectangle().frame(width: gageWidthOut, height: gageHeightOut)
////                                            .foregroundColor(.vegiGreen)
//                                .cornerRadius(8)

                            Rectangle().frame(width: gageWidthIn, height: gageHeightIn)

                                .cornerRadius(6)
                                .foregroundColor(gageVar.turnGreen2 ? .vegiGreen : .white)

                                .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 2))
                        
                    
//                            Rectangle().frame(width: gageWidthOut, height: gageHeightOut)
////                                            .foregroundColor(.vegiGreen)
//                                .cornerRadius(8)
                            Rectangle().frame(width: gageWidthIn, height: gageHeightIn)

                                .cornerRadius(6)
                                .foregroundColor(gageVar.turnGreen3 ? .vegiGreen : .white)
                                .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 2))
                        
                    } // Hstack
                } // vstack

                VStack {

                    HStack(spacing: 5) { // 빨강 게이지 스택
//                        Image(systemName: "hare")
                        Text("🍎")
                            .font(.system(size: 25))
                        
//                            Rectangle().frame(width: gageWidthOut, height: gageHeightOut)
////                                            .foregroundColor(.fruitRed)
//                                .cornerRadius(8)
                            Rectangle().frame(width: gageWidthIn, height: gageHeightIn)

                                .cornerRadius(6)
                                .foregroundColor(gageVar.turnRed1 ? .fruitRed : .white)

                                .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 2))
                        
                        
//                            Rectangle().frame(width: gageWidthOut, height: gageHeightOut)
////                                            .foregroundColor(.fruitRed)
//                                .cornerRadius(8)

                            Rectangle().frame(width: gageWidthIn, height: gageHeightIn)

                                .cornerRadius(6)
                                .foregroundColor(gageVar.turnRed2 ? .fruitRed : .white)

                                .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 2))
                        
                        
//                            Rectangle().frame(width: gageWidthOut, height: gageHeightOut)
////                                            .foregroundColor(.fruitRed)
//                                .cornerRadius(8)

                            Rectangle().frame(width: gageWidthIn, height: gageHeightIn)

                                .cornerRadius(6)
                                .foregroundColor(gageVar.turnRed3 ? .fruitRed : .white)

                                .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 2))
                        
                    } // Hstack
                } // vstack

                VStack {

                    HStack(spacing: 5) { // 오렌지 게이지 스택
//                        Image(systemName: "fish")
                        Text("🍖")
                            .font(.system(size: 25))
                        ZStack {

//                            Rectangle().frame(width: gageWidthOut, height: gageHeightOut)
////                                            .foregroundColor(.meatYellow)
//                                .cornerRadius(8)
                            Rectangle().frame(width: gageWidthIn, height: gageHeightIn)

                                .cornerRadius(6)
                                .foregroundColor(gageVar.turnOrange1 ? .meatYellow : .white)
                                .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 2))
                        }
                        ZStack {

//                            Rectangle().frame(width: gageWidthOut, height: gageHeightOut)
////                                            .foregroundColor(.meatYellow)
//                                .cornerRadius(8)
                            Rectangle().frame(width: gageWidthIn, height: gageHeightIn)

                                .cornerRadius(6)
                                .foregroundColor(gageVar.turnOrange2 ? .meatYellow : .white)
                                .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 2))
                        }
                        ZStack {

//                            Rectangle().frame(width: gageWidthOut, height: gageHeightOut)
////                                            .foregroundColor(.meatYellow)
//                                .cornerRadius(8)
                            Rectangle().frame(width: gageWidthIn, height: gageHeightIn)

                                .cornerRadius(6)
                                .foregroundColor(gageVar.turnOrange3 ? .meatYellow : .white)
                                .overlay(RoundedRectangle(cornerRadius: 6).stroke(.black, lineWidth: 2))
                        }
                    } // Hstack
                } // vstack
            } // 각 게이지와 레벨 상태 표시 상태창 스택
        }.offset(x: UIScreen.width * -0.14)
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
            .environmentObject(gageVariables())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
