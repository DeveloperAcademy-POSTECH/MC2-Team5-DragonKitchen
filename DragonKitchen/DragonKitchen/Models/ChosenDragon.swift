//
//  ChosenDragon.swift
//  DragonKitchen
//
//  Created by 김기영 on 2023/05/10.
//

import Foundation
class ChosenDragon: ObservableObject {

    @Published var levelCount: Int = 1
    @Published var chosenDragon: (String, String) = ("", "")

}
