//
//  PolaroidView.swift
//  DragonKitchen
//
//  Created by 허준혁 on 2023/05/12.
//

import SwiftUI

struct PolaroidView: View {
    @EnvironmentObject var chosen: ChosenFood

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()

            VStack {
                if let image = chosen.pictureWithIngredient {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding(30)
                }

                Text("이엘이랑 파프리카를 먹었어요!")
                    .font(.cookierun(.regular))
                    .offset(y: -20)
            }
        }
    }
}

struct PolaroidView_Previews: PreviewProvider {
    static var previews: some View {
        PolaroidView()
    }
}
