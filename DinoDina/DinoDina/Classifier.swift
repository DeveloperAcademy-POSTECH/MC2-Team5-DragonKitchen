//
//  Classifier.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/03.
//

import CoreImage
import CoreML
import Vision

class Classifier {
    // 이미지에 대한 분류 결과를 저장해주는 프로퍼티
    private(set) var results: String?
    // core image 형식인 CIImage를 받아서, 가장 비슷한 분류 결과를 results로 세팅해주는 함수
    func detect(ciImage: CIImage) {
        guard let model = try? VNCoreMLModel(for: MyImageClassifier(configuration: MLModelConfiguration()).model)
        else {
            print("model load failed")
            return
        }

        let request = VNCoreMLRequest(model: model)

        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])

        try? handler.perform([request])

        guard let results = request.results as? [VNClassificationObservation] else {
            print("result request failed")
            return
        }

        if let firstResult = results.first {
            self.results = firstResult.identifier
        }
    }
}
