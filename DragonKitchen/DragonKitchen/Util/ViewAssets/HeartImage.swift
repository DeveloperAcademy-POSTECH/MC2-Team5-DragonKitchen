//
//  HeartImage.swift
//  DragonKitchen
//
//  Created by 김기영 on 2023/05/11.
//

import Foundation
import SwiftUI

struct HeartImage: View{
    @State var xOffset: CGFloat
    @State var yOffset: CGFloat
    @State var heartWidth = Double.random(in: 20 ... 50)
    @State var heartColor: Color
    
    var body: some View{
        ZStack{
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(heartColor)
                .frame(width: heartWidth)
                .offset(x: xOffset, y: yOffset + 30)
                .modifier(HeartModifier())
                .shadow(color:heartColor ,radius: 4)
                .padding()
        }
    }
}
