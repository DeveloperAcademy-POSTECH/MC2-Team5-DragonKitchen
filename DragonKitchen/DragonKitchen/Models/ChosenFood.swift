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
    @Published var pictureWithIngredient: UIImage?
}
