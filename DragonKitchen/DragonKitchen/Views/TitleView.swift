//
//  TitleView.swift
//  DragonKitchen
//
//  Created by 김기영 on 2023/05/10.
//

import NavigationStack
import SwiftUI

struct TitleView: View {
    @EnvironmentObject var sound: SoundEffect
    var body: some View {
        NavigationStackView(transitionType: .none) {
            ZStack {
                Image("TitleBackground")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Image("Title")
                        .resizable()
                        .frame(width: UIScreen.width * 0.5, height: UIScreen.height * 0.4)
                        .padding()
                    PushView(destination: SelectView()) {
                        RoundedButton(widthScale: 0.2, heightScale: 0.12, content: "시작하기", contentSize: 20, contentColor: .buttonTextColor, isActive: true)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        sound.buttonSelect.play()
                    })
                }
            }
            .onAppear{
                sound.erevBgm.play(numberOfLoops: -1)
//                sound.buttonSelect.volume = 0.3
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
