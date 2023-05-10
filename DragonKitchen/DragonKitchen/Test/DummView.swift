//
//  DummView.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/09.
//

import SwiftUI

struct DummView: View {
    @State var isCleared: Bool = false
    var body: some View {
        VStack {
            NavigationBar(isCleared: $isCleared)
            Image("StandingHiel")
                .resizable()
                .scaledToFit()
            Button(action: {
                isCleared = true
            }, label: {
                Text("Tap to clear")
            })
        }
    }
}

struct DummView_Previews: PreviewProvider {
    static var previews: some View {
        DummView(isCleared: false)
    }
}
