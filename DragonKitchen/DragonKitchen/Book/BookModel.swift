//
//  Ingredient.swift
//  DragonKitchen
//
//  Created by David Goggins on 2023/05/06.
//

import Foundation
import SwiftUI

struct IngredientData: Hashable {
    let id: Int
    let name: String
    let illust: String
    var picture: String
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
                IngredientData(id: 1, name: "사과", illust: "apple", picture: "noPicture"),
                IngredientData(id: 2, name: "아보카도", illust: "avocado", picture: "bananaImage"),
                IngredientData(id: 3, name: "바나나", illust: "banana", picture: "watermelonImage"),
                IngredientData(id: 4, name: "블루베리", illust: "blueberry", picture: "grapeImage"),
                IngredientData(id: 5, name: "키위", illust: "kiwi", picture: "noPicture"),
                IngredientData(id: 6, name: "오렌지", illust: "orange", picture: "noPicture"),
                IngredientData(id: 7, name: "복숭아", illust: "peach", picture: "딸grapeImage"),
                IngredientData(id: 8, name: "딸기", illust: "strawberry", picture: "풋grapeImage")
            ]
        case .vegetable:
            return [
                IngredientData(id: 1, name: "완두콩", illust: "bean", picture: "noPicture"),
                IngredientData(id: 2, name: "브로콜리", illust: "broccoli", picture: "noPicture"),
                IngredientData(id: 3, name: "양상추", illust: "cabbage", picture: "cabbage"),
                IngredientData(id: 4, name: "당근", illust: "carrot", picture: "noPicture"),
                IngredientData(id: 5, name: "오이", illust: "cucumber", picture: "noPicture"),
                IngredientData(id: 6, name: "가지", illust: "eggplant", picture: "noPicture"),
                IngredientData(id: 7, name: "버섯", illust: "mushroom", picture: "c"),
                IngredientData(id: 8, name: "양파", illust: "onion", picture: "o"),
                IngredientData(id: 9, name: "파프리카", illust: "paprika", picture: "noPicture"),
                IngredientData(id: 10, name: "토마토", illust: "tomato", picture: "noPicture")
            ]
        case .meat:
            return [
                IngredientData(id: 1, name: "치즈", illust: "cheese", picture: "appleImage"),
                IngredientData(id: 2, name: "닭고기", illust: "chicken", picture: "bananaImage"),
                IngredientData(id: 3, name: "조개", illust: "clam", picture: "watermelonImage"),
                IngredientData(id: 4, name: "물고기", illust: "Fish", picture: "grapeImage"),
                IngredientData(id: 5, name: "고기", illust: "meat", picture: "grapeImage"),
                IngredientData(id: 6, name: "우유", illust: "milk", picture: "grapeImage"),
                IngredientData(id: 7, name: "새우", illust: "shrimp", picture: "grapeImage"),
                IngredientData(id: 8, name: "오징어", illust: "squid", picture: "grapeImage"),
            ]
        }
    }
}
