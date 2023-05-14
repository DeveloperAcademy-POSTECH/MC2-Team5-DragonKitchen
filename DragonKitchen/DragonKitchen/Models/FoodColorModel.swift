//
//  FoodColorModel.swift
//  DragonKitchen
//
//  Created by 박상원 on 2023/05/13.
//

import Foundation
import SwiftUI

class VegetableColor: ObservableObject {
    @Published var carrotColor: (stem: Color, pattern: Color, body: Color, shadow: Color) = CarrotColor().gray
    @Published var paprikaColor: (stemHead: Color, stem: Color, pattern: Color, body: Color, shadow: Color) = PaprikaColor().gray
}

class CarrotColor {
    var gray = (Color(hex: 0x7C7C7C), Color(hex: 0x646464), Color(hex: 0x8E8E8E), Color(hex: 0x000000))
    var red = (Color(hex: 0x00AE26), Color(hex: 0xAE0000), Color(hex: 0xE50000), Color(hex: 0x000000))
    var brown = (Color(hex: 0x00AE26), Color(hex: 0x54260B), Color(hex: 0x914517), Color(hex: 0x000000))
    var yellow = (Color(hex: 0x00AE26), Color(hex: 0xCAB302), Color(hex: 0xF6DA00), Color(hex: 0x000000))
    var green = (Color(hex: 0x00AE26), Color(hex: 0x187511), Color(hex: 0x41AF39), Color(hex: 0x000000))
    var burgundy = (Color(hex: 0x00AE26), Color(hex: 0xDA625A), Color(hex: 0x960A00), Color(hex: 0x000000))
    var orange = (Color(hex: 0x00AE26), Color(hex: 0xC9751C), Color(hex: 0xFF6F00), Color(hex: 0x000000))
}

class PaprikaColor {
    var gray = (Color(hex: 0x656565), Color(hex: 0x9A9A9A), Color(hex: 0x9C9C9C), Color(hex: 0x646464), Color(hex: 0x000000))
    var red = (Color(hex: 0x5D651B), Color(hex: 0x8C9B00), Color(hex: 0xF36868), Color(hex: 0xB62626), Color(hex: 0x000000))
    var brown = (Color(hex: 0x5B6500), Color(hex: 0x889C00), Color(hex: 0xD77D3D), Color(hex: 0x722100), Color(hex: 0x000000))
    var yellow = (Color(hex: 0x5B6500), Color(hex: 0x889C00), Color(hex: 0xFFE682), Color(hex: 0xFFBF00), Color(hex: 0x000000))
    var green = (Color(hex: 0x5B6500), Color(hex: 0x889C00), Color(hex: 0x9FE793), Color(hex: 0x008545), Color(hex: 0x000000))
    var burgundy = (Color(hex: 0x5B6500), Color(hex: 0x889C00), Color(hex: 0xCF4147), Color(hex: 0x6D0000), Color(hex: 0x000000))
    var orange = (Color(hex: 0x5B6500), Color(hex: 0x889C00), Color(hex: 0xFF7900), Color(hex: 0xFF5B00), Color(hex: 0x000000))
}
