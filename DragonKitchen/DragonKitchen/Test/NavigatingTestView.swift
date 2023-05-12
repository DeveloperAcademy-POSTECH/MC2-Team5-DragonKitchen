//
//  NavigatingView.swift
//  DragonKitchen
//
//  Created by 박상원 on 2023/05/11.
//

import SwiftUI

struct NavigatingTestView: View {
    @EnvironmentObject var currentPage: CurrentPageModel
    var body: some View {
        ZStack{
            VStack{
                NavigationBar(isCleared: .constant(true))
                    .padding(.horizontal, UIScreen.width*0.1)
                    .ignoresSafeArea()
                Spacer()
            }
            .zIndex(1000)
            switch currentPage.currentPage{
            case .eye:
                TasteView()
//                ColorQuestView()
            case .hand:
                TextureQuestView()
            case .ear:
                QuestHearView()
            case .mouth:
                TasteView()
            default: Text("hi")
            }
        }
    }
}

struct NavigatingTestView_Previews: PreviewProvider {
    static var previews: some View {
        NavigatingTestView()
            .environmentObject(CurrentPageModel())
            .environmentObject(ChosenFood())
            .environmentObject(ChosenDragon())
    }
}
