//
//  IngredientView.swift
//  DragonKitchen
//
//  Created by 허준혁 on 2023/05/13.
//

import SwiftUI

struct IngredientView: View {
    var ingredientData: IngredientData
    var ingredient: Ingredient

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(ingredientData.picture != "noPicture" ? ingredient.color : Color.white)
            .opacity(ingredientData.picture != "noPicture" ? 0.15 : 1)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(ingredientData.picture != "noPicture" ? ingredient.color : Color.black, lineWidth: 1.5)
            )

        VStack {
            Spacer()

            Image(ingredientData.picture != "noPicture" ? ingredientData.illust : ingredientData.illust + "GrayColor")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:70, height: 70, alignment: .bottom)

            Spacer()

            Text(ingredientData.name)
                .font(.system(size: 20))
                .foregroundColor(.black)
                .background(ingredientData.picture != "noPicture" ? Color.white.opacity(0.75) : Color.bookNameBackground)
                .cornerRadius(8)
                .font(.subheadline)
        }
    }
}
