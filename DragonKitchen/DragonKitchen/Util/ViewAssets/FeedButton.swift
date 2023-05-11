//
//  TestMainView.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/03.
//

import NavigationStack
import SwiftUI

struct FeedButton: View {
    @Binding var isPresenting: Bool
    @Binding var isClicked: Bool
    var body: some View {
        VStack {
            ZStack {
                Image("Dish")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.width*0.2)
                    
                Image("DishCover")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.width*0.14)
                    .offset(x:  isClicked ? -UIScreen.width * 0.025:UIScreen.width * 0.005, y: isClicked ? -UIScreen.height * 0.01 : -UIScreen.height * 0.04)
                    .rotationEffect(Angle(degrees: isClicked ? 55 : 0), anchor: .bottomTrailing)
            }
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isClicked = true
                    isPresenting = true
                }
            }
        }
    }
}

struct FeedButton_Previews: PreviewProvider {
    static var previews: some View {
        FeedButton(isPresenting: .constant(false), isClicked: .constant(false))
    }
}
