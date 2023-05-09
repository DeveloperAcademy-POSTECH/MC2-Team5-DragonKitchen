//
//  QuestEarView.swift
//  DinoDina
//
//  Created by 허준혁 on 2023/05/02.
//

import SwiftUI

struct QuestHearView: View {
    var body: some View {
        ZStack {
            Color.questBackgroundColor
                .ignoresSafeArea()

            VStack {
                Text("파프리카로 어떤 소리를 낼 수 있을까요?")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding()

                RecordingButton()
            }
        }

    }
}

struct QuestEarView_Previews: PreviewProvider {
    static var previews: some View {
        QuestHearView()
    }
}
