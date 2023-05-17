//
//  FoodResultView.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/03.
//

import NavigationStack
import SwiftUI
import Foundation

struct FoodResultView: View {
    @State private var zoomed = false
    @Namespace private var smooth
    @State private var paprikaOn = false
    @EnvironmentObject var chosen: ChosenFood
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    @EnvironmentObject private var sound: SoundEffect

    var body: some View {
        ZStack {
            Color.questBackgroundColor.ignoresSafeArea()
            ZStack {
                Image("Doma")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500)
                    .offset(y: 80)
                    .offset(x: paprikaOn ? -UIScreen.width : 0)
                    .onAppear {
                        sound.fallEffect.play()
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
                        Image(chosen.chosenFood.0+"Gray")
                            .resizable()
                            .grayscale(1.0)
                            .matchedGeometryEffect(id: "morph", in: smooth)
                            .offset(y: zoomed ? 0 : -UIScreen.height * 1.8)
                    }
                } else {
                    ZStack {
                        Image(chosen.chosenFood.0+"Gray")
                            .resizable()
                            .grayscale(1.0)
                            .matchedGeometryEffect(id: "morph", in: smooth)
                            .scaledToFit()
                            .scaleEffect(0.675)
                            .offset(y: zoomed ? 0 : -UIScreen.height * 1.9)
                            .offset(x: paprikaOn ? -UIScreen.width*0.2 : 0, y: paprikaOn ? UIScreen.height*0.1 : 0)
                    }
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
