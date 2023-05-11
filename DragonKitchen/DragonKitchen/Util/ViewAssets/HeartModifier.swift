
//  HeartModifier.swift
//  DinoDina
//
//  Created by 김기영 on 2023/05/10.
//

import Foundation
import SwiftUI

struct HeartModifier: ViewModifier {
    @State var time = 0.0
    let duration = 1.0

    func body(content: Content) -> some View {
        ZStack {
            content
                .foregroundColor(.red)
                .modifier(HeartEffect(time: time))
                .opacity(time == 1 ? 0 : 1)
        }
        .onAppear {
            withAnimation(.easeOut(duration: duration)) {
                self.time = duration
            }
        }
    }
} // 하트 움직임 Viewmodifier
