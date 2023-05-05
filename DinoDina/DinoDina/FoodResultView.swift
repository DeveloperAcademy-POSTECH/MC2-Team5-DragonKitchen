//
//  FoodResultView.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/03.
//

import SwiftUI

struct FoodResultView: View {
    @ObservedObject var chosen: chosenFruit
    
    var body: some View {
        Text(chosen.chosenfruit)
    }
}

struct FoodResultView_Previews: PreviewProvider {
    static var previews: some View {
        FoodResultView(chosen: chosenFruit())
            .environmentObject(chosenFruit())
    }
}
