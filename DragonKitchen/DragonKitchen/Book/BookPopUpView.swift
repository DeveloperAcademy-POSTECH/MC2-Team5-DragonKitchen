//
//  BookPopUpView.swift
//  DragonKitchen
//
//  Created by 허준혁 on 2023/05/13.
//

import SwiftUI

struct BookPopUpView: View{
    @Binding var isPresenting: Bool
    @Binding var isClicked: Bool
    @Binding var selectedVegiIllust: String
    @Binding var selectedVegiName: String
    
    var body: some View{
        ZStack {
            ZStack {
                Color.white.cornerRadius(20)
                RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2.0)
                VStack(alignment: .center, spacing: 0) {
                    Image("guide").resizable().scaledToFit().scaleEffect(0.7)
                        .offset(y: -UIScreen.height * 0.02)
                    Text("이엘or진화랑 \(selectedVegiName)을 먹었어요!")
                        .multilineTextAlignment(.center)
                        .font(.cookierun(.regular))
                        .padding(.bottom)
                }
                .padding(.vertical, 15)
            }
            .frame(width: UIScreen.width * 0.6, height: UIScreen.height * 0.76)
            .padding(.top, isPresenting ? 0 : UIScreen.height * 3)
            
            Image(systemName: "xmark")
                .font(.system(size: 28, weight: .ultraLight))
                .padding(.leading, UIScreen.width * 0.53)
                .padding(.top, isPresenting ? -UIScreen.height * 0.35 : UIScreen.height * 3)
                .foregroundColor(Color(red: 153 / 255, green: 153 / 255, blue: 153 / 255))
                .onTapGesture {
                    withAnimation(.easeIn(duration: 0.3)) {
                        isClicked = false
                        isPresenting = false
                    }
                }
            ZStack {
                RoundedButton(widthScale: 0.3, heightScale: 0.148, content: "확인!", contentSize: 25, contentColor: .buttonTextColor, isActive: true)
            }
            .onTapGesture {
                isClicked = false
                isPresenting = false
            }
            .padding(.top, isPresenting ? UIScreen.height * 0.75 : UIScreen.height * 3)
        }
        .foregroundColor(.black)
        .padding(.top)

    }
}
