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

            VStack(spacing: 0) {
                if let image = chosenFood.pictureWithIngredient {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding([.horizontal, .top], 20)
//                        .padding(.horizontal, UIScreen.width * 0.01)
                }

                Text(chosenDragon.chosenDragon.1 + (chosenDragon.chosenDragon.1 == "이엘" ? "이에게 " : "에게 ") + chosenFood.chosenFood.1 + (chosenFood.chosenFood.1 == "파프리카" ? "를" : "을") + " 주었어요!")
                    .font(.cookierun(.regular))
                    .foregroundColor(.black)
                    .padding(.top, 15)
                Spacer()
            }
        }
    }
}

struct PolaroidView_Previews: PreviewProvider {
    static var previews: some View {
        PolaroidView()
            .environmentObject(ChosenDragon())
            .environmentObject(ChosenFood())
    }
}
