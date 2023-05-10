//
//  AudioPlayer.swift
//  DinoDina
//
//  Created by 허준혁 on 2023/05/02.
//

import SwiftUI
import AVFoundation

final class AudioPlayer: NSObject, ObservableObject, AVAudioPlayerDelegate {
    lazy var audioPlayer = AVAudioPlayer()

    // TODO: URL이 아니라 식재료명(ex: "tomato") 받아다가 재생시키기
    func startPlayback(audio: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audio)
            audioPlayer.delegate = self
            audioPlayer.play()
        } catch {
            print("Playback failed.")
        }
    }

    func stopPlayback() {
        audioPlayer.stop()
    }
}
