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
}
