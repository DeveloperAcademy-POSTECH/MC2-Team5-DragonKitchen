//
//  ChosenFruit.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/04.
//

import SwiftUI
import Foundation

class ChosenFood: ObservableObject {
    @Published var chosenFood: (String, String) = ("paprika", "")
    @Published var chosenColor: String = ""
    @Published var pictureWithIngredient: UIImage?
}
