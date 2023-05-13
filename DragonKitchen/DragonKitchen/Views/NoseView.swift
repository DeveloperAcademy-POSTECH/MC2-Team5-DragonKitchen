//
//  NoseView.swift
//  DinoDina
//
//  Created by 김시은 on 2023/05/10.
//

import SwiftUI

struct NoseView: View {
    let images = ["Normal 2","Smile", "Close", "Dizz", "Sad", "Strange"]

    @State private var currentImageIndex = 0

    @State var isCleared: Bool = false
    @State var isImageVisible = false
    @State private var isAnimating = false

    var body: some View {
        ZStack{
            Color.questBackgroundColor
                .ignoresSafeArea()

            ZStack {
                VStack {
//                    NavigationBar(isCleared: $isCleared)
                    Spacer()
                }

                GIFView(name: images[currentImageIndex])
                    .frame(width: 620)
                    .position(x:UIScreen.width * 0.45, y: UIScreen.height * 0.65)
            }
            .onTapGesture {
                currentImageIndex += currentImageIndex == images.count-1 ? -(images.count - 1) : 1
                self.isImageVisible = false
            }

            if isImageVisible {
                Image("touch")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
                    .position(x:UIScreen.width * 0.6, y: UIScreen.height * 0.65)
                    .opacity(isAnimating ? 1.0 : 0.0)
                    .animation(Animation.easeOut(duration: 0.5).repeatForever())
                    .onAppear {
                        self.isAnimating = true
                    }
                    .onDisappear {
                        self.isAnimating = false
                    }
                    .transition(.opacity)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                            withAnimation {
                                self.isImageVisible = false
                            }
                        }
                    }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                withAnimation {
                    self.isImageVisible = true
                }
            }
        }
    }
}

struct NoseView_Previews: PreviewProvider {
    static var previews: some View {
        NoseView()
    }
}
