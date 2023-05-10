//
//  TitleView.swift
//  DragonKitchen
//
//  Created by 김기영 on 2023/05/10.
//

import SwiftUI
import NavigationStack

struct TitleView: View {
    var body: some View {
        NavigationStackView(transitionType: .none) {
            ZStack{
                Image("TitleBackground")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    Image("Title")
                        .resizable()
                        .frame(width: UIScreen.width * 0.5, height: UIScreen.height * 0.4)
                        .padding()
                    RoundedButton(widthScale: 0.2, heightScale: 0.12, content: "시작하기", contentSize: 15, contentColor: .buttonTextColor , isActive: true)
                }
                
            }
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
