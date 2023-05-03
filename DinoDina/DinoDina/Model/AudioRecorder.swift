//
//  AudioRecorder.swift
//  DinoDina
//
//  Created by 허준혁 on 2023/05/02.
//

import SwiftUI
import Combine
import AVFoundation

final class AudioRecorder: NSObject, ObservableObject {
    override init() {
        super.init()
        fetchRecording()
    }

    let objectWillChange = PassthroughSubject<AudioRecorder, Never>()
    lazy var audioRecorder = AVAudioRecorder()
    var recordingFile: URL?
    var isRecording = false {
        didSet {
            objectWillChange.send(self)
        }
    }

    func startRecording() {
        let recordingSession = AVAudioSession.sharedInstance()
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            print("Failed to set up recording session")
        }

        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        // TODO: Model에서 식재료명 받아다 파일명 설정해주기 :)
        let audioFilename = documentPath.appendingPathComponent("tomato")
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.record()
            isRecording = true
        } catch {
            print("Could not start recording")
        }
        // TODO: 3초 후 애니메이션이 끝나면 녹음 중지하기
    }

    func stopRecording() {
        audioRecorder.stop()
        isRecording = false
        fetchRecording()
    }

    func fetchRecording() {
        recordingFile = nil
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        do {
            let directoryContents = try fileManager.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
            for audio in directoryContents {
                recordingFile = audio
            }
            objectWillChange.send(self)
        } catch {
            print("Could not fetch recording")
        }
    }

    func deleteRecording(url: URL) {
        do {
            try FileManager.default.removeItem(at: url)
        } catch {
            print("File could not be deleted!")
        }
        fetchRecording()
    }
}
