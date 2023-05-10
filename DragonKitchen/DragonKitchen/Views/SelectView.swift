//
//  SelectView.swift
//  DragonKitchen
//
//  Created by 김기영 on 2023/05/10.
//

import SwiftUI
import NavigationStack


struct SelectView: View {
    let eggWidth = UIScreen.width * 0.21
    @EnvironmentObject var chosen : ChosenDragon
    @State var isHielGray = false
    @State var isPluGray = false
    @State var isHielGlow = false
    @State var isPluGlow = false
    @State var buttonWidth = UIScreen.width * 0.075
    var body: some View {
        ZStack{
            Color.questBackgroundColor
                .ignoresSafeArea()
            VStack{
                Spacer()
                HStack(){
                    Spacer().frame(width: UIScreen.width * 0.25)
                    Text("어떤 공룡을 키울까요?")
                        .font(.system(size: 35))
                    Spacer()
                    if chosen.chosenDragon == "" {
                        Image("DisabledGoButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: buttonWidth)
                    }
                    else {
                        PushView(destination: MainView()){
                            Image("GoButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: buttonWidth)
                        }
                    }
                }
                HStack{
                    VStack{
                        Image("EggPlu")
                            .resizable()
                            .scaledToFit()
                            .frame(width: eggWidth)
                            .shadow(color: isPluGray ? .clear : .buttonColor ,radius: isPluGlow ? 10 : 0)
                            .animation(.easeInOut.repeatForever(), value: isPluGlow)
                            .grayscale(isPluGray ? 1 : 0)
                            .onTapGesture {
                                isHielGray = true
                                isPluGray = false
                                isPluGlow = true
                                chosen.chosenDragon = "Plu"
                            }
                        Text("플루")
                            .font(.system(size: 25))
//
                    }
                    Spacer().frame(width: UIScreen.width * 0.11)
                    VStack{
                        Image("EggHiel")
                            .resizable()
                            .scaledToFit()
                            .frame(width: eggWidth)
                            .shadow(color:isHielGray ? .clear : .buttonColor ,radius: isHielGlow ? 10 : 0)
                            .animation(.easeInOut.repeatForever(), value: isHielGlow)
                            .grayscale(isHielGray ? 1 : 0)
                            .onTapGesture {
                                isPluGray = true
                                isHielGray = false
                                isHielGlow = true
                                chosen.chosenDragon = "Hiel"
                            }
                        Text("이엘")
                            .font(.system(size: 25))
//
                    }
                }

            }
        }
    }
}

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView()
            .previewInterfaceOrientation(.landscapeRight)
            .environmentObject(ChosenDragon())
            
    }
}
