//
//  DinoDinaApp.swift
//  DinoDina
//
//  Created by 허준혁 on 2023/05/02.
//

import SwiftUI

@main
struct DragonKitchenApp: App {
    var body: some Scene {
        WindowGroup {
            TitleView()
                .environmentObject(ChosenFood())
                .environmentObject(ChosenDragon())
                .environmentObject(gageVariables())
                .environmentObject(CurrentPageModel())
                .environmentObject(VegetableColor())
                .environmentObject(SoundEffect())
                .environmentObject(NavigateModel())
        }
    }
}
