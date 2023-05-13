//
//  BookModel.swift
//  DinoDina
//
//  Created by David Goggins on 2023/05/06.
//

import Foundation
import SwiftUI

struct Fruit: Hashable { // ForEach문 안에서 활용하기 위해, Hashable 채택
    let id: Int
    let name: String
    let illust: String // 추후 이미지타입 변경
    var sound: String // 추후 사운드 타입 변경
    var picture: String // 추후 이미지타입 변경
}

struct Vegetable: Hashable {
    let id: Int
    let name: String
    let illust: String // 추후 이미지타입 변경
    var sound: String // 추후 사운드 타입 변경
    var picture: String // 추후 이미지타입 변경
}

struct Meat: Hashable {
    let id: Int
    let name: String
    let fruitIllust: String // 추후 이미지타입 변경
    var sound: String // 추후 사운드 타입 변경
    var picture: String // 추후 이미지타입 변경
}

extension Fruit {
    static let allFruit = [ // <- 이것을 하는 이유는?
        Fruit(id: 1, name: "사과", illust: "apple", sound: "사각사각", picture: "noPicture"),
        Fruit(id: 2, name: "아보카도", illust: "avocado", sound: "우걱우걱", picture: "bananaImage"), // 닐 코얼레싱 이용해서 없는 값은 기본값 하나 주자
        Fruit(id: 3, name: "바나나", illust: "banana", sound: "투투투투", picture: "watermelonImage"),
        Fruit(id: 4, name: "블루베리", illust: "blueberry", sound: "씨가만타", picture: "grapeImage"),
        Fruit(id: 5, name: "키위", illust: "kiwi", sound: "피치피치", picture: "noPicture"),
        Fruit(id: 6, name: "오렌지", illust: "orange", sound: "아저씨", picture: "noPicture"),
        Fruit(id: 7, name: "복숭아", illust: "peach", sound: "딸기가좋아", picture: "딸grapeImage"),
        Fruit(id: 8, name: "딸기", illust: "strawberry", sound: "풋풋", picture: "풋grapeImage")
    ]
}

extension Vegetable {
    static var allVegetable = [ // <- 이것을 하는 이유는?
        Vegetable(id: 1, name: "완두콩", illust: "bean", sound: "사각사각", picture: "noPicture"),
        Vegetable(id: 2, name: "브로콜리", illust: "broccoli", sound: "우걱우걱", picture: "noPicture"), // 닐 코얼레싱 이용해서 없는 값은 기본값 하나 주자
        Vegetable(id: 3, name: "양상추", illust: "cabbage", sound: "투투투투", picture: "cabbage"),
        Vegetable(id: 4, name: "당근", illust: "carrot", sound: "씨가만타", picture: "noPicture"),
        Vegetable(id: 5, name: "오이", illust: "cucumber", sound: "씨가만타", picture: "noPicture"),
        Vegetable(id: 6, name: "가지", illust: "eggplant", sound: "씨가만타", picture: "noPicture"),
        Vegetable(id: 7, name: "버섯", illust: "mushroom", sound: "씨가만타", picture: "c"),
        Vegetable(id: 8, name: "양파", illust: "onion", sound: "씨가만타", picture: "o"),
        Vegetable(id: 9, name: "파프리카", illust: "paprika", sound: "씨가만타", picture: "noPicture"),
        Vegetable(id: 10, name: "토마토", illust: "tomato", sound: "씨가만타", picture: "noPicture")
    ]
}

extension Meat {
    static let allMeat = [ // <- 이것을 하는 이유는?
        Fruit(id: 1, name: "치즈", illust: "cheese", sound: "사각사각", picture: "appleImage"),
        Fruit(id: 2, name: "닭고기", illust: "chicken", sound: "우걱우걱", picture: "bananaImage"), // 닐 코얼레싱 이용해서 없는 값은 기본값 하나 주자
        Fruit(id: 3, name: "조개", illust: "clam", sound: "투투투투", picture: "watermelonImage"),
        Fruit(id: 4, name: "물고기", illust: "Fish", sound: "씨가만타", picture: "grapeImage"),
        Fruit(id: 5, name: "고기", illust: "meat", sound: "씨가만타", picture: "grapeImage"),
        Fruit(id: 6, name: "우유", illust: "milk", sound: "씨가만타", picture: "grapeImage"),
        Fruit(id: 7, name: "새우", illust: "shrimp", sound: "씨가만타", picture: "grapeImage"),
        Fruit(id: 8, name: "오징어", illust: "squid", sound: "씨가만타", picture: "grapeImage"),
    ]
}


