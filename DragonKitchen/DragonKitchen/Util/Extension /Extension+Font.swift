//
//  Extension+Font.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/10.
//

import Foundation
import SwiftUI

extension Font {
    enum CookieRun {
        case regular
        case bold
        case black
        case custom(String)
        
        var value: String {
            switch self {
            case .regular:
                return "CookieRun-Regular"
            case .bold:
                return "CookieRun-Bold"
            case .black:
                return "CookieRun-Black"
            case .custom(let name):
                return name
            }
        }
    }

    static func cookierun(_ type: CookieRun, size: CGFloat = 25) -> Font {
        return .custom(type.value, size: size)
    }
}
