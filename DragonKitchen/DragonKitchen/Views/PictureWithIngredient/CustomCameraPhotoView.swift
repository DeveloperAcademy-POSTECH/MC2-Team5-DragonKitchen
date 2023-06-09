//
//  CustomCameraPhotoView.swift
//  DragonKitchen
//
//  Created by 허준혁 on 2023/05/12.
//

import SwiftUI
import AVFoundation
import NavigationStack

struct CustomCameraPhotoView: View {
    @State var image: Image?
    @State private var showingCustomCamera = true
    @State private var inputImage: UIImage?
    @State var didTapCapture: Bool = false
    @EnvironmentObject var chosenFood: ChosenFood
    @EnvironmentObject var chosenDragon: ChosenDragon
    @EnvironmentObject var sound: SoundEffect

    var body: some View {
        ZStack {
            if let image = image {
                image
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()

                    ZStack {
                        Color.black
                            .frame(height: 100)
                            .opacity(0.5)
                            .ignoresSafeArea()

                        HStack {
                            Spacer()

                            Text("이 사진을 사용할까요?")
                                .foregroundColor(.white)
                                .font(.cookierun(.regular))

                            Spacer()

                            Image("againButton")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                                .onTapGesture {
                                    self.showingCustomCamera = true
                                    sound.buttonEffect.play()
                                }

                            PushView(destination: MissionCompleteView()) {
                                Image("checkButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 80)
                                    .padding(30)
                            }
                            .simultaneousGesture(TapGesture().onEnded{
                                sound.buttonEffect.play()
                            })
                            Spacer()
                        }
                    }
                    .offset(y: 30)
                    Spacer()
                }
            }
        }
        .sheet(isPresented: $showingCustomCamera, onDismiss: loadImage) {
            ZStack(alignment: .trailing) {
                CustomCameraRepresentable(image: self.$inputImage, didTapCapture: $didTapCapture, overlayImage: UIImage(named: "\(chosenFood.chosenFood.0)_\(chosenDragon.chosenDragon.0)_\(chosenFood.cooking.name)")!)
                    .ignoresSafeArea()

                // 카메라 촬영시 표시되는 캐릭터
                HStack {
                    Image(uiImage: UIImage(named:
                        "\(chosenFood.chosenFood.0)_\(chosenDragon.chosenDragon.0)_\(chosenFood.cooking.name)")!)
                        .resizable()
                        .scaledToFit()
                        .offset(y: 20)

                    Spacer()
                }

                Image("cameraButton")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .onTapGesture {
                        self.didTapCapture = true
                    }
            }
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        let cropRect = CGRect(x: 0, y: 500, width: 5000, height: 1850)
        chosenFood.pictureWithIngredient = inputImage.cropImage(toRect: cropRect)
    }
}
