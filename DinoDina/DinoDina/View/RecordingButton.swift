//
//  RecordingButton.swift
//  DinoDina
//
//  Created by 허준혁 on 2023/05/02.
//

import SwiftUI
import AVFoundation

struct RecordingButton: View {
    @ObservedObject var audioRecorder: AudioRecorder
    @ObservedObject var audioPlayer = AudioPlayer()
    @State private var remainingSecond = 3
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isCounting = false
    @State private var progressValue: Float = 0.0

    var body: some View {
        // 녹음된 파일 있을 때
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
                    Text("들어보기")
                        .onTapGesture {
                            self.audioPlayer.startPlayback(audio: recording)
                        }

                    Text("다시 녹음하기")
                        .onTapGesture {
                            isCounting = true
                            self.audioRecorder.deleteRecording(url: recording)
                            self.audioRecorder.readyRecording()
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                                isCounting = false
                                remainingSecond = 3
                                progressValue = 0.0
                            }
                        }

                    // 삭제 예정
                    Text("삭제")
                        .onTapGesture {
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

                Text("\(remainingSecond)")
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

struct ProgressCircle: View {
    @Binding var progress: Float
    var color: Color = Color.red

    var body: some View {
        Circle()
            .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
            .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
            .foregroundColor(Color.red)
            .rotationEffect(Angle(degrees: 270))
            .animation(.easeInOut(duration: 3.0))
    }
}

struct RecordingButton_Previews: PreviewProvider {
    static var previews: some View {
        RecordingButton(audioRecorder: AudioRecorder())
    }
}
