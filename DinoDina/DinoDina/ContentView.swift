//
//  ContentView.swift
//  DinoDina
//
//  Created by 허준혁 on 2023/05/02.
//

import SwiftUI
import CoreML
//import CreateMLComponents
//class ImageModel{
//    let defaultConfig = MLModelConfiguration()
//    let imageClassifierWrapper = try? MyImageClassifier(configuration: defaultConfig)
//}
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
