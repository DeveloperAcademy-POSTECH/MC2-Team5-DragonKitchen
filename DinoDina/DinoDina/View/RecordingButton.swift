//
//  RecordingButton.swift
//  DinoDina
//
//  Created by 허준혁 on 2023/05/02.
//

import SwiftUI

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
                ProgressBar(progress: self.$progressValue)
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
        // 시작화면 🍅
        } else {
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(height: 182)
                    .scaledToFit()
                    .shadow(color: .gray, radius: 10)

                PaprikaView()
                    .onTapGesture {
                        isCounting = true
                        self.audioRecorder.readyRecording()
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                            isCounting = false
                            remainingSecond = 3
                            progressValue = 0.0
                        }
                    }
            }
        }
    }
}

struct ProgressBar: View {
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
