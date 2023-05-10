//
//  DinoDinaApp.swift
//  DinoDina
//
//  Created by 허준혁 on 2023/05/02.
//

import SwiftUI

@main
struct DinoDinaApp: App {
    var body: some Scene {
        WindowGroup {
//            TestMainView(classifier: ImageClassifier())
//            FoodCameraView(classifier: ImageClassifier())
//            MainView()
//                .environmentObject(ChosenFood())
//                .environmentObject(gageVariables())
            TitleView()
                .environmentObject(ChosenFood())
                .environmentObject(gageVariables())
//            TestMainView(classifier: ImageClassifier())
//                .environmentObject(chosenFruit())
        }
    }
}
