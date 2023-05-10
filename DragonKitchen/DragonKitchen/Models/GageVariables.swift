//
//  GageVariables.swift
//  DinoDina
//
//  Created by 김기영 on 2023/05/08.
//

import Foundation

class gageVariables: ObservableObject {
    @Published var turnGreen1 = false
    @Published var turnGreen2 = false
    @Published var turnGreen3 = false
    @Published var greenCount: Int = 0
    @Published var turnRed1 = false
    @Published var turnRed2 = false
    @Published var turnRed3 = false
    @Published var redCount: Int = 0
    @Published var turnOrange1 = false
    @Published var turnOrange2 = false
    @Published var turnOrange3 = false
    @Published var orangeCount: Int = 0
}
