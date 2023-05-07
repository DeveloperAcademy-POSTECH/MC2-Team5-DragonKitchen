//
//  TestMainView.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/03.
//

import NavigationStack
import SwiftUI

struct FeedButton: View {
    @Binding var isPresenting: Bool

    var body: some View {
        VStack {
            Button {
                withAnimation(.easeInOut(duration: 0.5)) {
                    isPresenting = true
                }
            } label: {
                Image("Dish")
                    .frame(width: 100, height: 100)
            }
        }
        // 카메라 화면
    }
}

struct FeedButton_Previews: PreviewProvider {
    static var previews: some View {
        FeedButton(isPresenting: .constant(false))
    }
}
