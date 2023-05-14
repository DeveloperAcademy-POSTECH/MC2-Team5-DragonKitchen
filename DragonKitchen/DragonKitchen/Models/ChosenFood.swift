//
//  ChosenFruit.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/04.
//

import Foundation
import SwiftUI

class ChosenFood: ObservableObject {
    @Published var chosenFood: (String, String) = ("", "")
    @Published var chosenColor: String = ""
    @Published var cooking: Cooking = .raw
    @Published var pictureWithIngredient: UIImage?
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
