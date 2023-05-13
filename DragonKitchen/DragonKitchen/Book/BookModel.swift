//
//  Ingredient.swift
//  DragonKitchen
//
//  Created by David Goggins on 2023/05/06.
//

import Foundation
import SwiftUI

struct Ingredient: Hashable { // ForEach문 안에서 활용하기 위해, Hashable 채택
    let id: Int
    let name: String
    let illust: String // 추후 이미지타입 변경
    var picture: String // 추후 이미지타입 변경
}

extension Ingredient {
    static let fruits = [
        Ingredient(id: 1, name: "사과", illust: "apple", picture: "noPicture"),
        Ingredient(id: 2, name: "아보카도", illust: "avocado", picture: "bananaImage"),
        Ingredient(id: 3, name: "바나나", illust: "banana", picture: "watermelonImage"),
        Ingredient(id: 4, name: "블루베리", illust: "blueberry", picture: "grapeImage"),
        Ingredient(id: 5, name: "키위", illust: "kiwi", picture: "noPicture"),
        Ingredient(id: 6, name: "오렌지", illust: "orange", picture: "noPicture"),
        Ingredient(id: 7, name: "복숭아", illust: "peach", picture: "딸grapeImage"),
        Ingredient(id: 8, name: "딸기", illust: "strawberry", picture: "풋grapeImage")
    ]

    static let vegetables = [ // <- 이것을 하는 이유는?
        Ingredient(id: 1, name: "완두콩", illust: "bean", picture: "noPicture"),
        Ingredient(id: 2, name: "브로콜리", illust: "broccoli", picture: "noPicture"),
        Ingredient(id: 3, name: "양상추", illust: "cabbage", picture: "cabbage"),
        Ingredient(id: 4, name: "당근", illust: "carrot", picture: "noPicture"),
        Ingredient(id: 5, name: "오이", illust: "cucumber", picture: "noPicture"),
        Ingredient(id: 6, name: "가지", illust: "eggplant", picture: "noPicture"),
        Ingredient(id: 7, name: "버섯", illust: "mushroom", picture: "c"),
        Ingredient(id: 8, name: "양파", illust: "onion", picture: "o"),
        Ingredient(id: 9, name: "파프리카", illust: "paprika", picture: "noPicture"),
        Ingredient(id: 10, name: "토마토", illust: "tomato", picture: "noPicture")
    ]

    static let meats = [ // <- 이것을 하는 이유는?
        Ingredient(id: 1, name: "치즈", illust: "cheese", picture: "appleImage"),
        Ingredient(id: 2, name: "닭고기", illust: "chicken", picture: "bananaImage"), // 닐 코얼레싱 이용해서 없는 값은 기본값 하나 주자
        Ingredient(id: 3, name: "조개", illust: "clam", picture: "watermelonImage"),
        Ingredient(id: 4, name: "물고기", illust: "Fish", picture: "grapeImage"),
        Ingredient(id: 5, name: "고기", illust: "meat", picture: "grapeImage"),
        Ingredient(id: 6, name: "우유", illust: "milk", picture: "grapeImage"),
        Ingredient(id: 7, name: "새우", illust: "shrimp", picture: "grapeImage"),
        Ingredient(id: 8, name: "오징어", illust: "squid", picture: "grapeImage"),
    ]
}
