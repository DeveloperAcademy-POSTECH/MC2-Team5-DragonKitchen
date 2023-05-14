//
//  PolaroidView.swift
//  DragonKitchen
//
//  Created by 허준혁 on 2023/05/12.
//

import SwiftUI

struct PolaroidView: View {
    @EnvironmentObject var chosenFood: ChosenFood
    @EnvironmentObject var chosenDragon: ChosenDragon

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()

            VStack {
                if let image = chosenFood.pictureWithIngredient {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding(30)
                }

                Text(chosenDragon.chosenDragon.1 + (chosenDragon.chosenDragon.1 == "이엘" ? "이랑" : "랑") + " 파프리카를 먹었어요!")
                    .font(.cookierun(.regular))
                    .offset(y: -20)
            }
        }
    }
}

struct PolaroidView_Previews: PreviewProvider {
    static var previews: some View {
        PolaroidView()
    }
}
