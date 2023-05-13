//
//  BookView.swift
//  DragonKitchen
//
//  Created by 허준혁 on 2023/05/13.
//

import SwiftUI
import NavigationStack

struct BookView: View {
    var body: some View {
        NavigationStackView(transitionType: .none) {
            VStack {
                HStack {
                    Text("야채")
                        .font(.system(size: 47, weight: .semibold))

                    Spacer()

                    PushView(destination: MainView()) {
                        Image("BackButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.width * 0.078)
                    }
                }
                .background(Color.vegiGreen.opacity(0.5))

                HStack {
                    ScrollView(showsIndicators: false, content: {
                        VegetableView()
                            .frame(width: 800)
                    })
//                    .background(Color.red)

//                    Spacer() 

                    Text("야채")
                        .background(Color.blue)
                }
//                .background(Color.yellow)
            }
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
    }
}
