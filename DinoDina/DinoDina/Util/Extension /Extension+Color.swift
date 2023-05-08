//
//  Extension+Color.swift
//  DinoDina
//
//  Created by 김기영 on 2023/05/07.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1){
        self.init(.sRGB, red: Double((hex >> 16) & 0xff) / 255, green: Double((hex >> 08) & 0xff) / 255, blue: Double((hex >> 00) & 0xff) / 255, opacity: alpha
        )
    }
    
    static let vegiGreen:Color = Color(hex: 0x41AF39)
    static let fruitRed:Color = Color(hex: 0xE20000)
    static let meatYellow:Color = Color(hex: 0xFFBA00)
    
}
