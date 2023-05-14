//
//  EggView.swift
//  DragonKitchen
//
//  Created by 김기영 on 2023/05/14.
//

import SwiftUI
import AVKit
import NavigationStack

struct EggView: View {
    @EnvironmentObject var chosen : ChosenDragon
    let player = AVPlayer()
    @State var isDisappear = false
    var body: some View {
        ZStack{
            Color.questBackgroundColor
                .ignoresSafeArea()

            VStack{
                Spacer()
                    .frame(height: UIScreen.height * 0.05)
                HStack{
                    Spacer()
                    if isDisappear == false {
                        Image("DisabledGoButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: SelectView().buttonWidth)
                    }
                    else {
                        PushView(destination: MainView(), destinationId: "mainViewId"){
                            Image("GoButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: SelectView().buttonWidth)
                            
                        }
                    }
                }
                ZStack{
                    VStack{
                        Text("안녕! 내 이름은 \(chosen.chosenDragon.1)!!")
                            .font(.cookierun(.regular))
                        Image("Standing\(chosen.chosenDragon.0)")
                            .resizable()
                            .scaledToFit()
                    }
                    VideoPlayer(player: player)
                        .frame(width: UIScreen.width * 0.5, height: UIScreen.height * 0.7)
                        .onAppear{
                            if player.currentItem == nil {
                                let item = AVPlayerItem(url: Bundle.main.url(forResource: "Sample", withExtension: "mp4")!)
                                player.replaceCurrentItem(with: item)
                            }
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                                player.play()
                            })
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5, execute: {
                                isDisappear = true
                            })
                        }
                        .opacity(isDisappear ? 0 : 1)
                }
            }
        }
    }
}

struct EggView_Previews: PreviewProvider {
    static var previews: some View {
        EggView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
