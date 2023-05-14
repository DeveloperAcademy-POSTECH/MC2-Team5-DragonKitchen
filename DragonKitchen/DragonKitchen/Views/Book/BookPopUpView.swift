//
//  BookPopUpView.swift
//  DragonKitchen
//
//  Created by 허준혁 on 2023/05/13.
//

import SwiftUI

struct BookPopUpView: View{
    @EnvironmentObject var chosenDragon: ChosenDragon
    @Binding var isPresenting: Bool
    @Binding var isClicked: Bool
    @Binding var selectedVegiIllust: String
    @Binding var selectedVegiName: String
    @Binding var selectedPicture: UIImage?
    
    var body: some View{
        ZStack {
            ZStack {
                Color.white.cornerRadius(20)
                RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2.0)
                VStack(alignment: .center, spacing: 0) {
                    if let picture = selectedPicture {
                        Image(uiImage: picture).resizable().scaledToFit().scaleEffect(0.7)
                            .offset(y: -UIScreen.height * 0.02)
                    }
                    if chosenDragon.chosenDragon.1 == "이엘" {
                        Text("\(chosenDragon.chosenDragon.1)이와 \(selectedVegiName) 먹은 날!")
                            .multilineTextAlignment(.center)
                            .font(.cookierun(.regular))
                            .padding(.bottom)
                            .padding(.bottom)
                    } else {
                        Text("\(chosenDragon.chosenDragon.1)와 \(selectedVegiName) 먹은 날!")
                            .multilineTextAlignment(.center)
                            .font(.cookierun(.regular))
                            .padding(.bottom)
                            .padding(.bottom)
                    }
                }
                .padding(.vertical, 15)
            }
            .frame(width: UIScreen.width * 0.6, height: UIScreen.height * 0.76)
            .padding(.top, isPresenting ? 0 : UIScreen.height * 3)
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
