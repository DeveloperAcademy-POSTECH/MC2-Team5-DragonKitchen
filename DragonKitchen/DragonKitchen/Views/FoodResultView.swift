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
    @EnvironmentObject var chosen: ChosenFood
    @State private var zoomed = false
    @Namespace private var smooth
    @State private var paprikaOn = false
    @EnvironmentObject private var navigationStack: NavigationStackCompat

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            ZStack {
                Image("Doma")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500)
                    .offset(y: 80)
                    .offset(x: paprikaOn ? -UIScreen.width : 0)
//                    .opacity(paprikaOn ? 0.0 : 1.0)
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
                    .onChange(of: paprikaOn) { _ in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            self.navigationStack.push(QuestView())
                        }
                    }
                if !zoomed {
                    ZStack {
                        Image(chosen.chosenFood.0)
                            .resizable()
                            .matchedGeometryEffect(id: "morph", in: smooth)
                            .offset(y: zoomed ? 0 : -UIScreen.height * 1.8)
                    }
                } else {
                    ZStack {
                        Image(chosen.chosenFood.0)
                            .resizable()
                            .matchedGeometryEffect(id: "morph", in: smooth)
                            .scaledToFit()
                            .frame(height: 200)
                            .offset(y: zoomed ? 0 : -UIScreen.height * 1.8)
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
