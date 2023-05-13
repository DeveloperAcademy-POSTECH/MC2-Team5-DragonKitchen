//
//  ProgressCircle.swift
//  DinoDina
//
//  Created by 허준혁 on 2023/05/09.
//

import SwiftUI

struct ProgressCircle: View {
    @Binding var progress: Float
    var color: Color = Color.red

    var body: some View {
        Circle()
            .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
            .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
            .foregroundColor(Color.red)
            .rotationEffect(Angle(degrees: 270))
            .animation(.easeInOut(duration: 3.0))
    }
}
