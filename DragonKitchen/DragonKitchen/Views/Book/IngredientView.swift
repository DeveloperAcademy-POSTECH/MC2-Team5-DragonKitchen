//
//  IngredientView.swift
//  DragonKitchen
//
//  Created by 허준혁 on 2023/05/13.
//

import SwiftUI

struct IngredientView: View {
    @EnvironmentObject var chosenFood: ChosenFood
    var ingredientData: IngredientData
    var ingredient: Ingredient

    var body: some View {
        if ingredientData.name == chosenFood.chosenFood.1 && chosenFood.pictureWithIngredient != nil {
            RoundedRectangle(cornerRadius: 10)
                .fill(ingredient.color)
                .opacity(0.15)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1.5)
                )

            VStack {
                Spacer()

                Image(ingredientData.illust)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:70, height: 70, alignment: .bottom)

                Spacer()

                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.white.opacity(0.75))
                        .frame(width: UIScreen.width * 0.12, height: UIScreen.height * 0.075)

                    Text(ingredientData.name)
                        .foregroundColor(.black)
                        .font(.cookierun(.regular, size: 18))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
        } else {
            RoundedRectangle(cornerRadius: 10)
                .fill(ingredientData.picture != nil ? ingredient.color : Color.white)
                .opacity(ingredientData.picture != nil ? 0.15 : 1)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(ingredientData.picture != nil ? ingredient.color : Color.black, lineWidth: 1.5)
                )

            VStack {
                Spacer()

                Image(ingredientData.picture != nil ? ingredientData.illust : ingredientData.illust + "GrayColor")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:70, height: 70, alignment: .bottom)

                Spacer()

                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(ingredientData.picture != nil ? Color.white.opacity(0.75) : Color.bookNameBackground)
                        .frame(width: UIScreen.width * 0.12, height: UIScreen.height * 0.075)

                    Text(ingredientData.name)
                        .foregroundColor(.black)
                        .font(.cookierun(.regular, size: 18))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
        }

    }
}
