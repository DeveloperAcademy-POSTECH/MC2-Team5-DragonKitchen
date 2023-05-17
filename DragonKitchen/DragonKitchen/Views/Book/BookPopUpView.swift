//
//  BookPopUpView.swift
//  DragonKitchen
//
//  Created by 허준혁 on 2023/05/13.
//

import SwiftUI

struct BookPopUpView: View{
    @EnvironmentObject var chosenDragon: ChosenDragon
    @EnvironmentObject var sound: SoundEffect
    @Binding var isPresenting: Bool
    @Binding var isClicked: Bool
    @Binding var selectedVegiIllust: String
    @Binding var selectedVegiName: String
    @Binding var selectedPicture: UIImage?
    
    var body: some View{
        ZStack {
            ZStack {
                Color.white.cornerRadius(10)
                VStack(alignment: .center, spacing: 0) {
                    if let picture = selectedPicture {
                        Image(uiImage: picture)
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(0.9)
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
            .shadow(radius: 2)
            .frame(width: UIScreen.width * 0.5, height: UIScreen.height * 0.76)
            .padding(.top, isPresenting ? 0 : UIScreen.height * 3)
            ZStack {
                RoundedButton(widthScale: 0.3, heightScale: 0.148, content: "확인!", contentSize: 25, contentColor: .buttonTextColor, isActive: true)
            }
            .onTapGesture {
                sound.buttonEffect.play()
                isClicked = false
                isPresenting = false
            }
            .padding(.top, isPresenting ? UIScreen.height * 0.75 : UIScreen.height * 3)
        }
        .foregroundColor(.black)
        .padding(.top)

    }
}
//
//struct Previews_BookPopUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookPopUpView(isPresenting: .constant(true), isClicked: .constant(false), selectedVegiIllust: .constant("hi"), selectedVegiName: .constant("hi"))
//            .environmentObject(ChosenDragon())
//        
//    }
//}
