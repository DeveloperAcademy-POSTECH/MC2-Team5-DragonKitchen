//
//  QuestEarView.swift
//  DinoDina
//
//  Created by 허준혁 on 2023/05/02.
//

import SwiftUI

struct QuestHearView: View {
    @ObservedObject var audioRecorder = AudioRecorder()

    var body: some View {
        VStack {
            Text("토마토에서 어떤 소리가 나나요?")
                .font(.title)
                .fontWeight(.heavy)
                .padding()

            HStack {
                RecordingButton(audioRecorder: audioRecorder)

                if let recording = audioRecorder.recordingFile {
                    Button(action: {self.audioRecorder.deleteRecording(url: recording)}) {
                        Text("삭제")
                    }
                }
            }
        }
    }
}

struct QuestEarView_Previews: PreviewProvider {
    static var previews: some View {
        QuestHearView(audioRecorder: AudioRecorder())
    }
}
