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
    var body: some View {
        VStack {
            ZStack{
                Image("Doma")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500)
                    .offset(y: 80)
                if !zoomed {
                    ZStack {
                        Image("tomato")
                            .resizable()
                            .matchedGeometryEffect(id: "morph", in: smooth)
                            .offset(y: zoomed ? 0 : -UIScreen.height * 1.8)
                    }
                } else {
                    ZStack {
                        Image("tomato")
                            .resizable()
                            .matchedGeometryEffect(id: "morph", in: smooth)
                            .scaledToFit()
                            .frame(height: 200)
                            .offset(y: zoomed ? 0 : -UIScreen.height * 1.8)
                    }
                }
            }
           
            Text("tap!")
                .onTapGesture {
                    withAnimation(
                        .interpolatingSpring(mass: 1, stiffness: 100, damping: 10, initialVelocity: 0.4)
                    ) {
                        zoomed.toggle()
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
