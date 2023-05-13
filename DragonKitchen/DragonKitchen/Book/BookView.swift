//
//  BookView.swift
//  DragonKitchen
//
//  Created by 허준혁 on 2023/05/13.
//

import SwiftUI
import NavigationStack

struct BookView: View {
    @State var ingredient: Ingredient = .vegetable

    var body: some View {
        NavigationStackView(transitionType: .none) {
            VStack {
                HStack {
                    Text(ingredient.title)
                        .font(.system(size: 47, weight: .semibold))

                    Spacer()

                    PushView(destination: MainView()) {
                        Image("BackButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.width * 0.078)
                    }
                }
                .background(Color.vegiGreen.opacity(0.5))

                HStack {
                    ScrollView(showsIndicators: false, content: {
                        IngredientView(ingredients: $ingredient)
                            .frame(width: 500)
                    })

                    VStack {
                        Text(Ingredient.vegetable.title)
                            .onTapGesture {
                                ingredient = .vegetable
                            }
                        Text(Ingredient.fruit.title)
                            .onTapGesture {
                                ingredient = .fruit
                            }
                        Text(Ingredient.meat.title)
                            .onTapGesture {
                                ingredient = .meat
                            }
                    }
                }
            }
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
    }
}
