//
//  ImageClassifier.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/03.
//

import SwiftUI

class ImageClassifier: ObservableObject{
    @Published private var classifier = Classifier()
    
    var imageClass: String?{
        classifier.results
    }
    
    // MARK: Intent(s)
    func detect(uiImage: UIImage){
        guard let ciImage = CIImage(image: uiImage) else{
            return
        }
        classifier.detect(ciImage: ciImage)
    }
}
