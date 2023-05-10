//
//  QuestEarView.swift
//  DinoDina
//
//  Created by 허준혁 on 2023/05/02.
//

import SwiftUI
import AVFoundation

struct QuestHearView: View {
    @ObservedObject var audioRecorder = AudioRecorder()
    @ObservedObject var audioPlayer = AudioPlayer()
    @State private var remainingSecond = 3
    @State private var isCounting = false
    @State private var progressValue: Float = 0.0
    @State var isCleared: Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            Color.questBackgroundColor
                .ignoresSafeArea()

            VStack {
                NavigationBar(pageText: 3, isOn: [true, true, true, false, false], isCleared: $isCleared)

                // 녹음 파일 있을 때
                if let recording = audioRecorder.recordingFile {
                    HStack {
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 5)
                                .foregroundColor(.red)
                                .frame(height: 185)

                            Circle()
                                .fill(Color(red: 239 / 255, green: 239 / 255, blue: 239 / 255))
                                .frame(height: 182)
                                .scaledToFit()

                            PaprikaView()
                        }
                        VStack {
                            RoundedButton(widthScale: 0.3, heightScale: 0.148, sfSymbolName: "speaker.wave.2", content: "들어보기", contentSize: 25, contentColor: .buttonTextColor, isActive: true)
                                .padding()
                                .onTapGesture {
                                    self.audioPlayer.startPlayback(audio: recording)
                                    isCleared = true
                                }

                            RoundedButton(widthScale: 0.3, heightScale: 0.148, sfSymbolName: "arrow.counterclockwise", content: "다시 녹음하기", contentSize: 25, contentColor: .buttonTextColor, isActive: true)
                                .onTapGesture {
                                    isCleared = false
                                    isCounting = true
                                    self.audioRecorder.deleteRecording(url: recording)
                                    self.audioRecorder.readyRecording()
                                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                                        isCounting = false
                                        remainingSecond = 3
                                        progressValue = 0.0
                                    }
                                }
                            // TODO: 발표 때는 삭제
                            Text("개발용 삭제 버튼")
                                .onTapGesture {
                                    isCleared = false
                                    self.audioRecorder.deleteRecording(url: recording)
                                }
                        }
                    }
                // 녹음중일 때
                } else if audioRecorder.isRecording {
                    ZStack {
                        ProgressCircle(progress: self.$progressValue)
                            .frame(width: 190.0, height: 190.0)
                            .padding(20.0)
                            .onAppear() {
                                progressValue = 1.0
                            }

                        Image("circle_recoding")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 182)

                        PaprikaView()
                    }
                // 카운트다운 중일 때
                } else if isCounting {
                    ZStack {
                        Image("circle_countdown")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 182)

                        PaprikaView()

                        Text(remainingSecond > 0 ? "\(remainingSecond)" : "시작")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .onReceive(timer) { _ in
                                if remainingSecond > 0 {
                                    remainingSecond -= 1
                                }
                            }
                    }
                // 시작화면
                } else {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(height: 182)
                            .scaledToFit()
                            .shadow(color: .gray, radius: 10)

                        PaprikaView()
                            .onTapGesture {
                                guard checkMicrophonePermission() else {
                                    askMicroPhonePermission()
                                    return
                                }
                                self.tappedButton()
                            }
                    }
                }

            }
        }
    }

    func tappedButton() {
        isCounting = true
        self.audioRecorder.readyRecording()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            isCounting = false
            remainingSecond = 3
            progressValue = 0.0
        }
    }

    func askMicroPhonePermission() {
        guard let microphoneUsageDescription = Bundle.main.object(forInfoDictionaryKey: "NSMicrophoneUsageDescription") as? String else {
            fatalError("NSMicrophoneUsageDescription not found in Info.plist")
        }
        switch AVCaptureDevice.authorizationStatus(for: AVMediaType.audio) {
        case .authorized:
            print("마이크 권한이 허용되어 있습니다.")
        case .denied, .restricted:
            print("마이크 권한이 거부되어 있습니다.")
            showPermissionAlert(with: microphoneUsageDescription)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: AVMediaType.audio) { _ in
                DispatchQueue.main.async {
                    if AVCaptureDevice.authorizationStatus(for: AVMediaType.audio) == .authorized {
                        self.tappedButton()
                    }
                }
            }
        @unknown default:
            fatalError("Unknown authorization status for microphone.")
        }
    }

    func checkMicrophonePermission() -> Bool {
        guard nil != Bundle.main.object(forInfoDictionaryKey: "NSMicrophoneUsageDescription") as? String else {
            fatalError("NSMicrophoneUsageDescription not found in Info.plist")
        }
        switch AVCaptureDevice.authorizationStatus(for: AVMediaType.audio) {
        case .authorized:
            return true
        case .denied, .restricted, .notDetermined:
            return false
        @unknown default:
            fatalError("Unknown authorization status for microphone.")
        }
    }

    func showPermissionAlert(with message: String) {
        let alert = UIAlertController(
            title: "마이크 권한 요청",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "설정", style: .default, handler: { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

//struct QuestEarView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestHearView(isCleared: .constant(false))
//    }
//}