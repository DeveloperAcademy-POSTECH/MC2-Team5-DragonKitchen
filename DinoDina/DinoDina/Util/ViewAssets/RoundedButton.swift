//
//  RoundedButton.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/07.
//

import SwiftUI

struct RoundedButton: View {
    var widthScale: CGFloat
    var heightScale: CGFloat
    var body: some View {
        ZStack {
            ZStack {
                ColorManage.ButtonShadowColor.cornerRadius(20)
                RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 1.5).foregroundColor(.black)
            }
            .frame(width: UIScreen.width * widthScale, height: UIScreen.height * heightScale)
            .padding([.top, .leading], 10)
            ZStack {
                ColorManage.ButtonColor.cornerRadius(20)
                RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 1.5).foregroundColor(.black)
            }
            .frame(width: UIScreen.width * widthScale, height: UIScreen.height * heightScale)
        }
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(widthScale: 0.3, heightScale: 0.148)
    }
}
