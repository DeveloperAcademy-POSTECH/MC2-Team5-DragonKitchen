//
//  CustomFont.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/10.
//

import SwiftUI

struct CustomFont {
    static func text(hi: String) -> Text {
        return Text(hi).font(.custom("CookieRun-Regular", size: 25))
    }
}

