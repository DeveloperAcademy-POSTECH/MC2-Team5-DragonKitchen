//
//  SoundModel.swift
//  DragonKitchen
//
//  Created by 박상원 on 2023/05/15.
//

import Foundation
import SwiftySound

class SoundEffect: ObservableObject {
    @Published var buttonSelect: Sound = .init(url: Bundle.main.url(forResource: "select_effect", withExtension: "mp3")!)!
    @Published var erevBgm: Sound = .init(url: Bundle.main.url(forResource: "Erev", withExtension: "mp3")!)!
    @Published var buttonEffect: Sound = .init(url: Bundle.main.url(forResource: "button_effect", withExtension: "mp3")!)!
    @Published var eggEffect: Sound = .init(url: Bundle.main.url(forResource: "egg_effect", withExtension: "mp3")!)!
    @Published var dishOpenEffect: Sound = .init(url: Bundle.main.url(forResource: "dish_open_effect", withExtension: "mp3")!)!
    @Published var dishCloseEffect: Sound = .init(url: Bundle.main.url(forResource: "dish_close_effect", withExtension: "mp3")!)!
    @Published var heartEffect: Sound = .init(url: Bundle.main.url(forResource: "heart_effect", withExtension: "mp3")!)!
    @Published var evolHeartEffect: Sound = .init(url: Bundle.main.url(forResource: "heart_effect1", withExtension: "mp3")!)!
    @Published var evolEffect: Sound = .init(url: Bundle.main.url(forResource: "evolution_effect", withExtension: "mp3")!)!
    @Published var eggOutEffect: Sound = .init(url: Bundle.main.url(forResource: "egg_out_effect", withExtension: "mp3")!)!
    @Published var fallEffect: Sound = .init(url: Bundle.main.url(forResource: "fall_effect", withExtension: "mp3")!)!
    @Published var endEffect: Sound = .init(url: Bundle.main.url(forResource: "mission_end_effect", withExtension: "mp3")!)!
    @Published var navEffect: Sound = .init(url: Bundle.main.url(forResource: "nav_effect", withExtension: "mp3")!)!
    @Published var bookEffect: Sound = .init(url: Bundle.main.url(forResource: "book_effect", withExtension: "mp3")!)!
}
