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
    @EnvironmentObject var CurrentPage: CurrentPageModel
    var body: some View {
        HStack(alignment: .top) {
            Image("BackButton")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.width * 0.078)
                .onTapGesture {
                    switch CurrentPage.CurrentPage.rawValue {
                    case 2: CurrentPage.CurrentPage = .Eye
                    case 3: CurrentPage.CurrentPage = .Hand
                    case 4: CurrentPage.CurrentPage = .Ear
                    case 5: CurrentPage.CurrentPage = .Nose
                    default:
                        break
                    }
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
                        .offset(y: -UIScreen.height * 0.1)
                    Group {
                        switch CurrentPage.CurrentPage {
                        case .Eye: Text("파프리카의 색은 무슨 색인가요?").lineLimit(1)
                        case .Hand: Text("파프리카를 만졌을 때 어떤 느낌인가요?").lineLimit(1)
                        case .Ear: Text("파프리카로 어떤 소리를 낼 수 있을까요?")
                            .lineLimit(1)
                        case .Nose:
                            Text("파프리카의 냄새를 맡고\n이엘은 어떤 표정을 지을까요?")
                                .multilineTextAlignment(.center)
                        case .Mouth: Text("자, 이제 파프리카를 이엘에게 줄 시간이에요!"
                            )
                        }
                    }
                    .frame(height: UIScreen.height * 0.2, alignment: .top)
                    .offset(y: UIScreen.height * 0.06)
                }
            }
            .font(.cookierun(.regular))
            .frame(width: UIScreen.width * 0.6, height: 80)
            Spacer()
            Image(isCleared ? "GoButton" : "DisabledGoButton")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.width * 0.078)
                .onTapGesture {
                    switch CurrentPage.CurrentPage.rawValue {
                    case 1: CurrentPage.CurrentPage = .Hand
                    case 2: CurrentPage.CurrentPage = .Ear
                    case 3: CurrentPage.CurrentPage = .Nose
                    case 4: CurrentPage.CurrentPage = .Mouth
                    default:
                        break
                    }
                    if isCleared {
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
                Circle().stroke(isActive ? .black : .disabledProgressBarColor, lineWidth: UIScreen.height * 0.005)
            }
    }
}

struct ProgressLine: View {
    @Binding var isActive: Bool

    var body: some View {
        Rectangle()
            .foregroundColor(isActive ? .black : .disabledProgressBarColor)
            .frame(width: UIScreen.width * 0.036, height: UIScreen.height * 0.005)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(isCleared: .constant(true))
            .environmentObject(CurrentPageModel())
    }
}
