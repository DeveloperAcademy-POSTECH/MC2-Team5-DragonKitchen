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
    @EnvironmentObject var chosen: ChosenFood

    var body: some View {
        NavigationStackView(transitionType: .none) {
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

                                PushView(destination: MissionCompleteView()) {
                                    Image("CheckButton")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 80)
                                        .padding(30)
                                }

                                Image("AgainButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 80)
                                    .onTapGesture {
                                        self.showingCustomCamera = true
                                    }
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
                    CustomCameraRepresentable(image: self.$inputImage, didTapCapture: $didTapCapture, overlayImage: UIImage(named: "PhotoHiel")!)
                        .ignoresSafeArea()

                    // 카메라 촬영시 표시되는 캐릭터
                    HStack {
                        Image(uiImage: UIImage(named: "PhotoHiel")!)
                            .resizable()
                            .scaledToFit()
                            .offset(y: 20)

                        Spacer()
                    }

                    Image("CameraButton")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .onTapGesture {
                            self.didTapCapture = true
                        }
                }
            }
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        let cropRect = CGRect(x: 0, y: 500, width: 5000, height: 1850)
        chosen.pictureWithIngredient = inputImage.cropImage(toRect: cropRect)
    }
}
