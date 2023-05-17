//
//  ChosenFruit.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/04.
//

import Foundation
import SwiftUI

class ChosenFood: ObservableObject {
    // 파프리카만 나오도록 변경
    @Published var chosenFood: (String, String) = ("", "")
    @Published var chosenColor: String = ""
    @Published var texture: FoodTexture = .basketball
    @Published var cooking: Cooking = .raw
    @Published var pictureWithIngredient: UIImage? = nil
}

enum FoodTexture: CaseIterable {
    case basketball
    case glass
    case sand
    case golf
    case wood
    case wool

    var name: String {
        switch self {
        case .basketball:
            return "basketball"
        case .glass:
            return "glass"
        case .sand:
            return "sand"
        case .golf:
            return "golf"
        case .wood:
            return "wood"
        case .wool:
            return "wool"
        }
    }
}

enum Cooking {
    case raw
    case toast
    case fry

    var name: String {
        switch self {
        case .raw:
            return "raw"
        case .toast:
            return "toast"
        case .fry:
            return "fry"
        }
    }
}
