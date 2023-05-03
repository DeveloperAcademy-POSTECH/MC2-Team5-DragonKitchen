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

    var body: some View {
        // 녹음된 파일 있을 때
        if let recording = audioRecorder.recordingFile {
            Button(action: {self.audioPlayer.startPlayback(audio: recording)}) {
                Image(systemName: "play.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .foregroundColor(.red)
            }
        // 녹음중일 때
        } else if audioRecorder.isRecording {
            Button(action: {self.audioRecorder.stopRecording()}) {
                Image(systemName: "stop.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .foregroundColor(.red)
            }
        // 시작화면 🍅
        } else {
            Button(action: {self.audioRecorder.startRecording()}) {
                Image("Tomato")
            }
        }
    }
}

struct RecordingButton_Previews: PreviewProvider {
    static var previews: some View {
        RecordingButton(audioRecorder: AudioRecorder())
    }
}
