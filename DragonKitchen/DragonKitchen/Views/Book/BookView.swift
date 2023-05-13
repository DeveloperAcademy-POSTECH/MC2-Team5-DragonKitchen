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
                        Text("나의 먹이 도감")
                            .font(.cookierun(.bold, size: 47))
                        
                        Spacer()
                        
                        PushView(destination: MainView()) {
                            Image("BackButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.width * 0.078)
                        }
                    }
                    .padding()

                    HStack {
                        Spacer()

                        ScrollView(showsIndicators: false, content: {
                            VStack(alignment: .center) {
                                LazyVGrid(columns: columns, alignment: .leading) {
                                    ForEach(ingredientModel.data, id: \.self) { ingredient in
                                        ZStack {
                                            IngredientView(ingredientData: ingredient, ingredient: ingredientModel)
                                                .padding(5)
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
                        .frame(width: 500)

                        Spacer()

                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.vegiGreen)
                                    .frame(width: UIScreen.width * 0.15, height: UIScreen.height * 0.1)
                                Text(Ingredient.vegetable.title)
                                    .font(.cookierun(.regular))
                            }
                            .onTapGesture {
                                ingredientModel = .vegetable
                            }
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.fruitRed)
                                    .frame(width: UIScreen.width * 0.15, height: UIScreen.height * 0.1)
                                Text(Ingredient.fruit.title)
                                    .font(.cookierun(.regular))
                            }
                            .onTapGesture {
                                ingredientModel = .fruit
                            }
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.meatYellow)
                                    .frame(width: UIScreen.width * 0.15, height: UIScreen.height * 0.1)
                                Text(Ingredient.meat.title)
                                    .font(.cookierun(.regular))
                            }
                            .onTapGesture {
                                ingredientModel = .meat
                            }
                        }
                    }
                }
                if isClicked {
                    Color.black.opacity(0.2).ignoresSafeArea()
                }
            }
            .overlay {
                BookPopUpView(isPresenting: $isPresenting, isClicked: $isClicked, selectedVegiIllust: $selectedVegiIllust, selectedVegiName: $selectedVegiName)
            }
            
        }
    }
}
