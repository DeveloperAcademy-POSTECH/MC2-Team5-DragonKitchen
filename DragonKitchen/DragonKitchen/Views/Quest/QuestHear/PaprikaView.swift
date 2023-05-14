//
//  TomatoView.swift
//  DinoDina
//
//  Created by 허준혁 on 2023/05/04.
//

import SwiftUI

struct PaprikaView: View {
    var body: some View {
        Image("paprika")
            .resizable()
            .scaledToFit()
            .frame(height: 111)
    }
}

struct TomatoView_Previews: PreviewProvider {
    static var previews: some View {
        PaprikaView()
    }
}
