//
//  CarrotTestView.swift
//  DragonKitchen
//
//  Created by 박상원 on 2023/05/12.
//

import SwiftUI

struct FoodImageView: View {
    @EnvironmentObject var colors: VegetableColor
    @EnvironmentObject var food: ChosenFood
    var body: some View {
        VStack {
            ZStack {
                Image("\(food.chosenFood.0)_shadow")
                    .resizable()
                    .renderingMode(.template).foregroundColor(colors.carrotColor.shadow)
                Image("\(food.chosenFood.0)_stem")
                    .resizable()
                    .renderingMode(.template).foregroundColor(colors.carrotColor.stem)
                Image("\(food.chosenFood.0)_body")
                    .resizable()
                    .renderingMode(.template).foregroundColor(colors.carrotColor.body)
                Image("\(food.chosenFood.0)_pattern")
                    .resizable()
                    .renderingMode(.template).foregroundColor(colors.carrotColor.pattern)
            }
            .scaledToFit()
            HStack {
                Text("red")
                    .onTapGesture {
                       colors.carrotColor = CarrotColor().burgundy
                    }
                Text("orange")
                    .onTapGesture {
                        colors.carrotColor = CarrotColor().orange
                    }
            }
        }
    }
}

struct CarrotTestView_Previews: PreviewProvider {
    static var previews: some View {
        FoodImageView()
            .environmentObject(VegetableColor())
            .environmentObject(ChosenFood())
    }
}
