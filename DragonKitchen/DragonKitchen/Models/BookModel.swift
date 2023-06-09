//
//  Ingredient.swift
//  DragonKitchen
//
//  Created by David Goggins on 2023/05/06.
//

import Foundation
import SwiftUI

struct IngredientData: Hashable {
    let name: String
    let illust: String
    var picture: UIImage?
}

enum Ingredient {
    case vegetable
    case fruit
    case meat

    var title: String {
        switch self {
        case .vegetable:
            return "야채"
        case .fruit:
            return "과일"
        case .meat:
            return "고기"
        }
    }

    var color: Color {
        switch self {
        case .vegetable:
            return .vegiGreen
        case .fruit:
            return .fruitRed
        case .meat:
            return .meatYellow
        }
    }

    var data: [IngredientData] {
        switch self {
        case .fruit:
            return [
                IngredientData(name: "사과", illust: "apple", picture: nil),
                IngredientData(name: "아보카도", illust: "avocado", picture: nil),
                IngredientData(name: "바나나", illust: "banana", picture: nil),
                IngredientData(name: "블루베리", illust: "blueberry", picture: nil),
                IngredientData(name: "키위", illust: "kiwi", picture: nil),
                IngredientData(name: "오렌지", illust: "orange", picture: nil),
                IngredientData(name: "복숭아", illust: "peach", picture: nil),
                IngredientData(name: "딸기", illust: "strawberry", picture: nil)
            ]
        case .vegetable:
            return [
                IngredientData(name: "완두콩", illust: "bean", picture: nil),
                IngredientData(name: "파프리카", illust: "paprika", picture: nil),
                IngredientData(name: "브로콜리", illust: "broccoli", picture: nil),
                IngredientData(name: "양상추", illust: "cabbage", picture: nil),
                IngredientData(name: "당근", illust: "carrot", picture: nil),
                IngredientData(name: "오이", illust: "cucumber", picture: nil),
                IngredientData(name: "가지", illust: "eggplant", picture: nil),
                IngredientData(name: "버섯", illust: "mushroom", picture: nil),
                IngredientData(name: "양파", illust: "onion", picture: nil),
                IngredientData(name: "토마토", illust: "tomato", picture: nil)
            ]
        case .meat:
            return [
                IngredientData(name: "치즈", illust: "cheese", picture: nil),
                IngredientData(name: "닭고기", illust: "chicken", picture: nil),
                IngredientData(name: "조개", illust: "clam", picture: nil),
                IngredientData(name: "물고기", illust: "fish", picture: nil),
                IngredientData(name: "고기", illust: "meat", picture: nil),
                IngredientData(name: "우유", illust: "milk", picture: nil),
                IngredientData(name: "새우", illust: "shrimp", picture: nil),
                IngredientData(name: "오징어", illust: "squid", picture: nil),
            ]
        }
    }
}
