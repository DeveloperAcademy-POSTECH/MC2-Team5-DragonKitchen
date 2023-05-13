//
//  BookView.swift
//  DragonKitchen
//
//  Created by 허준혁 on 2023/05/13.
//

import SwiftUI
import NavigationStack

struct BookView: View {
    @State var ingredientModel: Ingredient = .vegetable
    @State var isPresenting: Bool = false
    @State var isClicked: Bool = false
    @State var selectedVegiIllust = ""
    @State var selectedVegiName = ""
    @State var selectedPictureName = "noPicture"
    
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        NavigationStackView(transitionType: .none) {
            ZStack {
                VStack {
                    HStack {
                        Text(ingredientModel.title)
                            .font(.system(size: 47, weight: .semibold))
                        
                        Spacer()
                        
                        PushView(destination: MainView()) {
                            Image("BackButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.width * 0.078)
                        }
                    }
                    .background(ingredientModel.color.opacity(0.5))

                    HStack {
                        ScrollView(showsIndicators: false, content: {
                            VStack(alignment: .center) {
                                LazyVGrid(columns: columns, alignment: .leading) {
                                    ForEach(ingredientModel.data, id: \.self) { ingredient in
                                        ZStack {
                                            IngredientView(ingredientData: ingredient, ingredient: ingredientModel)
                                        }
                                        .onTapGesture {
                                            selectedVegiName = ingredient.name
                                            selectedPictureName = ingredient.picture
                                            if selectedPictureName != "noPicture" {
                                                withAnimation(.easeInOut(duration: 0.3)) {
                                                    isClicked = true
                                                    isPresenting = true
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        })

                        VStack {
                            Text(Ingredient.vegetable.title)
                                .onTapGesture {
                                    ingredientModel = .vegetable
                                }
                            Text(Ingredient.fruit.title)
                                .onTapGesture {
                                    ingredientModel = .fruit
                                }
                            Text(Ingredient.meat.title)
                                .onTapGesture {
                                    ingredientModel = .meat
                                }
                        }
                    }
                }
                .overlay {
                    BookPopUpView(isPresenting: $isPresenting, isClicked: $isClicked, selectedVegiIllust: $selectedVegiIllust, selectedVegiName: $selectedVegiName)
                }
            }
            
        }
    }
}
