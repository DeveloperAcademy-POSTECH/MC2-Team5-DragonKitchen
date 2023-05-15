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
//                    if isDisappear == false {
//                        Image("DisabledGoButton")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: SelectView().buttonWidth)
//                            .offset(y: UIScreen.height * 0.024)
//                    }
//                    else {
                        PushView(destination: MainView(), destinationId: "mainViewId"){
                            Image("GoButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: SelectView().buttonWidth)
                                .offset(y: UIScreen.height * 0.024)
                            
//                        }
                    }
                }
                ZStack{
                    VStack{
                        Text("안녕! 내 이름은 \(chosen.chosenDragon.1)!!")
                            .font(.cookierun(.regular))
                            .foregroundColor(.black )
                        Image("Standing\(chosen.chosenDragon.0)")
                            .resizable()
                            .scaledToFit()
                    }
                    VideoPlayer(player: player)
                        .frame(width: UIScreen.width * 0.4, height: UIScreen.height * 0.65)
                        .onAppear{
                            if player.currentItem == nil {
                                let item = AVPlayerItem(url: Bundle.main.url(forResource: "Egg\(chosen.chosenDragon.0)", withExtension: "mp4")!)
                                player.replaceCurrentItem(with: item)
                            }
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                                player.play()
                            })
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6.5, execute: {
                                isDisappear = true
                            })
                        }
                        .opacity(isDisappear ? 0 : 1)
                        .disabled(true)
                        .offset(y:UIScreen.height * -0.01)
                    Rectangle()
                        .foregroundColor(.questBackgroundColor)
                        .frame(width: UIScreen.width * 0.4, height: UIScreen.height * 0.15)
                        .opacity(isDisappear ? 0 : 1)
                        .offset(y:UIScreen.height * -0.33)
                    Rectangle()
                        .foregroundColor(.questBackgroundColor)
                        .frame(width: UIScreen.width * 0.4, height: UIScreen.height * 0.15)
                        .opacity(isDisappear ? 0 : 1)
                        .offset(y:UIScreen.height * 0.33)
                }
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
