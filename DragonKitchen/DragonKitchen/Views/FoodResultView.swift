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
    @State private var paprikaOn = false
    var body: some View {
        VStack {
            ZStack {
                Image("Doma")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500)
                    .offset(y: 80)
                    .offset(x: paprikaOn ? -UIScreen.width : 0)
                    .onAppear {
                        if !zoomed {
                            withAnimation(
                                .interpolatingSpring(mass: 1, stiffness: 100, damping: 10, initialVelocity: 0.4)
                            ) {
                                zoomed = true
                            }
                            withAnimation(.easeIn(duration: 1.5).delay(0.8)) {
                                paprikaOn = true
                            }
                        }
                    }
                if !zoomed {
                    ZStack {
                        Image("paprika")
                            .resizable()
                            .matchedGeometryEffect(id: "morph", in: smooth)
                            .offset(y: zoomed ? 0 : -UIScreen.height * 1.8)
                    }
                } else {
                    ZStack {
                        Image("paprika")
                            .resizable()
                            .matchedGeometryEffect(id: "morph", in: smooth)
                            .scaledToFit()
                            .frame(height: 200)
                            .offset(y: zoomed ? 0 : -UIScreen.height * 1.8)
                    }
//                    .onAppear {
//
//                    }
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
