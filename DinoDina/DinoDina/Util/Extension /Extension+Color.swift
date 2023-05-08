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
}
