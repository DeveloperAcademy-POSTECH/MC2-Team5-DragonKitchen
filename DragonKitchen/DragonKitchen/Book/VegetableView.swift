//
//  VegetableView.swift
//  DragonKitchen
//
//  Created by 허준혁 on 2023/05/13.
//

import SwiftUI

struct VegetableView: View {
    let columns = [
        GridItem(.flexible(), spacing: 125),
        GridItem(.flexible(), spacing: 125),
        GridItem(.flexible(), spacing: 125),
        GridItem(.flexible(), spacing: 125)
    ]
    @State var isPresenting: Bool = false
    @State var selectedVegiName = ""
    @State var selectedVegiIllust = ""
    @State var selectedPictureName = "noPicture"

    var body: some View {
        VStack(alignment: .center) {
            LazyVGrid(columns: columns, alignment: .leading) {
                ForEach(Ingredient.vegetables, id: \.self) { vegetable in
                    ZStack {
                        if vegetable.picture != "noPicture" {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.vegiGreen)
                                .opacity(0.15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.vegiGreen, lineWidth: 1.5)
                                )
                                .frame(width: 119, height: 140)
                                .padding(8)
                        } else {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .overlay (
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1.5)
                                )
                                .frame(width: 119, height: 140)
                                .padding(8)
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
                                    .frame(width: 97, height: 31, alignment: .top)
                                    .background(Color.white.opacity(0.75))
                                    .cornerRadius(8)
                                    .font(.subheadline)
                                    .padding(16)
                            } else {
                                Text(vegetable.name)
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .frame(width: 97, height: 31, alignment: .top)
                                    .background(Color.bookNameBackground)
                                    .cornerRadius(8)
                                    .font(.subheadline)
                                    .padding(16)
                            }
                        }
                    }
                    .onTapGesture {
                        selectedVegiName = vegetable.name
                        selectedPictureName = vegetable.picture
                        if selectedPictureName != "noPicture" {
                            isPresenting = true
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isPresenting) {
            BookPopUpView(isPresenting: $isPresenting, selectedVegiIllust: $selectedVegiIllust, selectedVegiName: $selectedVegiName)
        }
    }
}

struct VegetableView_Previews: PreviewProvider {
    static var previews: some View {
        VegetableView()
    }
}
