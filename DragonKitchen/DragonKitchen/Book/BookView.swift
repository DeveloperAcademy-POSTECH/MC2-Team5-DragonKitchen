//
//  BookView.swift
//  DragonKitchen
//
//  Created by 허준혁 on 2023/05/13.
//

import SwiftUI
import NavigationStack

struct BookView: View {
    @State var ingredients: Ingredient = .vegetable
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
                        Text(ingredients.title)
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
                            VStack(alignment: .center) {
                                LazyVGrid(columns: columns, alignment: .leading) {
                                    ForEach(ingredients.data, id: \.self) { vegetable in
                                        ZStack {
                                            if vegetable.picture != "noPicture" {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.vegiGreen)
                                                    .opacity(0.15)
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color.vegiGreen, lineWidth: 1.5)
                                                    )
                                                //                                .frame(width: 119, height: 140)
                                                //                                .padding(8)
                                            } else {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.white)
                                                    .overlay (
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(Color.black, lineWidth: 1.5)
                                                    )
                                                //                                .frame(width: 119, height: 140)
                                                //                                .padding(8)
                                            }
                                            VStack {
                                                Spacer()
                                                
                                                Image(vegetable.illust)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width:70, height: 70, alignment: .bottom)
                                                
                                                Spacer()
                                                
                                                if vegetable.picture != "noPicture" {
                                                    Text(vegetable.name)
                                                        .font(.system(size: 20))
                                                        .foregroundColor(.black)
                                                    //                                    .frame(width: 97, height: 31, alignment: .top)
                                                        .background(Color.white.opacity(0.75))
                                                        .cornerRadius(8)
                                                        .font(.subheadline)
                                                    //                                    .padding(16)
                                                } else {
                                                    Text(vegetable.name)
                                                        .font(.system(size: 20))
                                                        .foregroundColor(.black)
                                                    //                                    .frame(width: 97, height: 31, alignment: .top)
                                                        .background(Color.bookNameBackground)
                                                        .cornerRadius(8)
                                                        .font(.subheadline)
                                                    //                                    .padding(16)
                                                }
                                            }
                                        }
                                        .onTapGesture {
                                            selectedVegiName = vegetable.name
                                            selectedPictureName = vegetable.picture
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
                                    ingredients = .vegetable
                                }
                            Text(Ingredient.fruit.title)
                                .onTapGesture {
                                    ingredients = .fruit
                                }
                            Text(Ingredient.meat.title)
                                .onTapGesture {
                                    ingredients = .meat
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
//
//struct BookView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookView()
//    }
//}
