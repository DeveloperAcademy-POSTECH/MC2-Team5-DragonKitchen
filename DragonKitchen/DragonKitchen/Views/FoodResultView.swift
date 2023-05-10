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
    @State private var zoomed = false
    @Namespace private var smooth
    @State var heights: CGFloat = 200
    var body: some View {
        VStack {
            if !zoomed {
                ZStack {
                    Image(chosen.chosenFood)
                        .resizable()
                        .matchedGeometryEffect(id: "morph", in: smooth)
//                        .frame(height: heights)
                        .offset(y: zoomed ? 0 : -UIScreen.height * 1.8)
                }
            } else {
                ZStack {
                    Image(chosen.chosenFood)
                        .resizable()
                        .matchedGeometryEffect(id: "morph", in: smooth)
                        .scaledToFit()
                        .frame(height: heights)
                        .offset(y: zoomed ? 0 : -UIScreen.height * 1.8)
                }
            }
            Text("tap!")
                .onTapGesture {
                    withAnimation(
                        .interpolatingSpring(mass: 1, stiffness: 200, damping: 10, initialVelocity: 0)
                    ) {
                        zoomed.toggle()
//                        heights = 300
                    }
                }
        }
    }
}

struct FoodResultView_Previews: PreviewProvider {
    static var previews: some View {
        FoodResultView()
            .environmentObject(ChosenFood())
    }
}
