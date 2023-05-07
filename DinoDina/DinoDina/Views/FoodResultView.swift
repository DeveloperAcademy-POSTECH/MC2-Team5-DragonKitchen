//
//  FoodResultView.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/03.
//

import NavigationStack
import SwiftUI

struct FoodResultView: View {
    @EnvironmentObject var chosen: ChosenFood
    var body: some View {
        VStack {
            Text(chosen.chosenFood)
        }
    }
}

struct FoodResultView_Previews: PreviewProvider {
    static var previews: some View {
        FoodResultView()
            .environmentObject(ChosenFood())
    }
}
