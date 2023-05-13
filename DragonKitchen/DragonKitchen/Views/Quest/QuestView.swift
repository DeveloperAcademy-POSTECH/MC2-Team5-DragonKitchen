//
//  NavigatingView.swift
//  DragonKitchen
//
//  Created by 박상원 on 2023/05/11.
//

import SwiftUI

struct QuestView: View {
    @EnvironmentObject var currentPage: CurrentPageModel
    @State var isQuestCleared: [Bool] = Array(repeating: false, count: 5)
    var body: some View {
        ZStack{
            VStack{
                NavigationBar(isCleared: $isQuestCleared)
                    .padding(.horizontal, UIScreen.width*0.07)
                    .ignoresSafeArea()
                Spacer()
            }
            .zIndex(1)
            switch currentPage.currentPage{
            case .eye:
                ColorQuestView(isCleared: $isQuestCleared[currentPage.currentPage.rawValue - 1])
            case .hand:
                TextureQuestView(isCleared: $isQuestCleared[currentPage.currentPage.rawValue - 1])
            case .ear:
                QuestHearView(isCleared: $isQuestCleared[currentPage.currentPage.rawValue - 1])
            case .mouth:
                TasteView()
            default: Text("hi")
            }
        }
    }
}

struct QuestView_Previews: PreviewProvider {
    static var previews: some View {
        QuestView()
            .environmentObject(CurrentPageModel())
            .environmentObject(ChosenFood())
            .environmentObject(ChosenDragon())
            .environmentObject(VegetableColor())
    }
}
