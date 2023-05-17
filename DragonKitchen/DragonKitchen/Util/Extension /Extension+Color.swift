//
//  Extension+Color.swift
//  DinoDina
//
//  Created by 김기영 on 2023/05/07.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(.sRGB, red: Double((hex >> 16) & 0xFF) / 255, green: Double((hex >> 08) & 0xFF) / 255, blue: Double((hex >> 00) & 0xFF) / 255, opacity: alpha)
    }

    static let vegiGreen: Color = .init(hex: 0x41AF39)
    static let fruitRed: Color = .init(hex: 0xE20000)
    static let meatYellow: Color = .init(hex: 0xFFBA00)
    static let buttonTextColor: Color = .init(.white)
    static let buttonColor: Color = .init(hex: 0x1B9090)
    static let buttonShadowColor: Color = .init(hex: 0x1E5151)
    static let disabledButtonColor: Color = .init(hex: 0x9FB4B4)
    static let disabledButtonShadowColor: Color = .init(hex: 0x6A7878)
    static let disabledProgressBarColor: Color = .init(hex: 0xD8D8D8)
    static let ProgressBarColor: Color = .init(hex: 0xFFBA00)
//    static let questBackgroundColor: Color = .init(hex: 0xFFF4E7)
    static let questBackgroundColor: Color = Color(red: 252/255, green: 246/255, blue: 232/255)
    static let paprikaRed: Color = .init(hex: 0xE50000)
    static let paprikaGreen: Color = .init(hex: 0x188406)
    static let paprikaBurgundy: Color = .init(hex: 0x960A00)
    static let paprikaOrange: Color = .init(hex: 0xFF6F00)
    static let paprikaYellow: Color = .init(hex: 0xF6DA00)
    static let paprikaBrown: Color = .init(hex: 0x6A2901)
    static let bookNameBackground: Color = .init(hex: 0xF2F2F2)
}
