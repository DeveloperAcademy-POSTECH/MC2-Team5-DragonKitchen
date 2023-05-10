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
    var sfSymbolName: String?
    var content: String
    var contentSize: CGFloat
    var contentColor: Color
    var isActive: Bool

    var body: some View {
        ZStack {
            ZStack {
                isActive ? Color.buttonShadowColor.cornerRadius(20) : Color.disabledButtonShadowColor.cornerRadius(20)
                RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 1.5).foregroundColor(.black)
            }
            .frame(width: UIScreen.width * widthScale, height: UIScreen.height * heightScale)
            .padding([.top, .leading], 10)
            ZStack {
                isActive ? Color.buttonColor.cornerRadius(20) : Color.disabledButtonColor.cornerRadius(20)
                RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 1.5).foregroundColor(.black)
                HStack {
                    if let sfSymbolName = sfSymbolName {
                        Image(systemName: sfSymbolName)
                            .font(.system(size: contentSize, weight: .semibold))
                            .foregroundColor(contentColor)
                    }
                    Text(content).font(.system(size: contentSize)).foregroundColor(contentColor)
                }
            }
            .frame(width: UIScreen.width * widthScale, height: UIScreen.height * heightScale)
        }
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(widthScale: 0.3, heightScale: 0.148, content: "좋아요!", contentSize: 25, contentColor: .buttonTextColor, isActive: true)
    }
}
