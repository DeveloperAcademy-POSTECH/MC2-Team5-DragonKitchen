//
//  NavigationBar.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/09.
//

import SwiftUI

struct NavigationBar: View {
    @State var page: Int = 1
    @State var pageText: Int = 1
    @State var isOn = [true, false, false, false, false]
    @Binding var isCleared: Bool
    var body: some View {
        HStack(alignment: .top) {
            Image("BackButton")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.width * 0.078)
                .onTapGesture {
                    pageText -= 1
                    withAnimation(.easeInOut(duration: 0.5)) {
                        page -= 1
                        isOn[page] = false
                    }
                }
            Spacer()
            VStack {
                ZStack {
                    DefaultProgressBar(page: $page, isOn: $isOn)
                        .frame(width: 300)
                }
                switch pageText {
                case 1: Text("파프리카의 색은 무슨 색인가요?").lineLimit(1).font(.system(size: 28))
                case 2: Text("파프리카를 만졌을 때 어떤 느낌인가요?").lineLimit(1).font(.system(size: 28))
                case 3: Text("파프리카로 어떤 소리를 낼 수 있을까요?")
                    .lineLimit(1).font(.system(size: 28))
                case 4: VStack {
                    Text("파프리카의 냄새를 맡고")
                    Text("이엘은 어떤 표정을 지을까요?")
                }.font(.system(size: 28))
                case 5: Text("자, 이제 파프리카를 이엘에게 줄 시간이에요!"
                    ).font(.system(size: 28))
                default: Text("hi")
                }
                Spacer()
            }
            .frame(width: UIScreen.width*0.6, height: 120)
            Spacer()
            Image(isCleared ? "GoButton" : "DisabledGoButton")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.width * 0.078)
                .onTapGesture {
                    if isCleared{
                        pageText += 1
                        withAnimation(.easeInOut(duration: 0.5)) {
                            page += 1
                            isOn[page - 1] = true
                        }
                    }
                }
        }
        .padding(.top, 30)
    }
}

struct DefaultProgressBar: View {
    @Binding var page: Int
    @Binding var isOn: [Bool]
    var body: some View {
        HStack(spacing: 0.7) {
            ProgressStep(isActive: $isOn[0])
            ProgressLine(isActive: $isOn[1])
            ProgressStep(isActive: $isOn[1])
            ProgressLine(isActive: $isOn[2])
            ProgressStep(isActive: $isOn[2])
            ProgressLine(isActive: $isOn[3])
            ProgressStep(isActive: $isOn[3])
            ProgressLine(isActive: $isOn[4])
            ProgressStep(isActive: $isOn[4])
        }
    }
}

struct ProgressStep: View {
    @Binding var isActive: Bool
    var body: some View {
        Circle()
            .foregroundColor(isActive ? .ProgressBarColor : .disabledProgressBarColor)
            .frame(width: UIScreen.width * 0.0178)
            .overlay {
                Circle().stroke(isActive ? .black : .disabledProgressBarColor, lineWidth: 2)
            }
    }
}

struct ProgressLine: View {
    @Binding var isActive: Bool

    var body: some View {
        Rectangle()
            .foregroundColor(isActive ? .black : .disabledProgressBarColor)
            .frame(width: UIScreen.width * 0.04, height: 2)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(isCleared: .constant(false))
    }
}
