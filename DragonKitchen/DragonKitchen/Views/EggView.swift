//
//  EggView.swift
//  DragonKitchen
//
//  Created by 김기영 on 2023/05/14.
//

import AVKit
import NavigationStack
import SwiftUI

struct EggView: View {
    @EnvironmentObject var chosen: ChosenDragon
    @EnvironmentObject var sound: SoundEffect
    @EnvironmentObject private var navigationStack: NavigationStackCompat

    let player = AVPlayer()
    @State var isDisappear = false
    var body: some View {
        ZStack {
            Color.questBackgroundColor
                .ignoresSafeArea()
                .onAppear{
                    player.isMuted = true
                }

            VStack {
                Spacer()
                    .frame(height: UIScreen.height * 0.16)
                ZStack {
                    VStack(spacing: 0) {
                        Text("안녕! 내 이름은 \(chosen.chosenDragon.1)!!")
                            .font(.cookierun(.regular, size: 30))
                            .foregroundColor(.black)
                        Image("Standing\(chosen.chosenDragon.0)")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(1.2)
                            .offset(y: -UIScreen.height * 0.05)
                    }
                }
            }
            ZStack {
                VideoPlayer(player: player)
                    .frame(width: UIScreen.width * 0.615, height: UIScreen.height)
                    .onAppear {
                        if player.currentItem == nil {
                            let item = AVPlayerItem(url: Bundle.main.url(forResource: "Egg\(chosen.chosenDragon.0)", withExtension: "mp4")!)
                            player.replaceCurrentItem(with: item)
                        }
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
                            player.play()
                        }
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6.5) {
                            isDisappear = true
                            sound.eggOutEffect.play()
                        }
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 8.0) {
                            navigationStack.push(MainView(), withId: "mainViewId")
                        }
                    }
                    .opacity(isDisappear ? 0 : 1)
                    .disabled(true)
                    .offset(y: UIScreen.height * 0.05)
                VStack {
                    Rectangle().frame(height: UIScreen.height * 0.1)
                        .foregroundColor(.questBackgroundColor)
                    Spacer()
                }
            }
            .onAppear{
                sound.eggEffect.play()
            }
        }
    }
}

struct EggView_Previews: PreviewProvider {
    static var previews: some View {
        EggView()
            .previewInterfaceOrientation(.landscapeRight)
            .environmentObject(ChosenDragon())
    }
}
