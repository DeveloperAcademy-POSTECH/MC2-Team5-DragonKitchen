//
//  NavigationBar.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/09.
//

import NavigationStack
import SwiftUI

struct NavigationBar: View {
    @State var page: Int = 1
    @State var pageText: Int = 1
    @State var isOn = [true, false, false, false, false]
    @Binding var isCleared: [Bool]
    @Binding var isPopupActive: Bool
    @Binding var isDimmed: Bool
    @EnvironmentObject var CurrentPage: CurrentPageModel
    @EnvironmentObject var chosenDragon: ChosenDragon
    @EnvironmentObject var chosenFood: ChosenFood
    @EnvironmentObject private var navigationStack: NavigationStackCompat

    var body: some View {
        HStack(alignment: .top) {
            Image("BackButton")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.width * 0.078)
                .onTapGesture {
                    switch CurrentPage.currentPage.rawValue {
                    case 2: CurrentPage.currentPage = .eye
                    case 3: CurrentPage.currentPage = .hand
                    case 4: CurrentPage.currentPage = .ear
                    case 5: CurrentPage.currentPage = .nose
                    default:
                        break
                    }
                    isCleared[CurrentPage.currentPage.rawValue] = false
                    withAnimation(.easeInOut(duration: 0.5)) {
                        if page == 1 {
                            self.navigationStack.pop(to: .view(withId: "mainViewId"))
                        } else {
                            page -= 1
                            isOn[page] = false
                        }
                    }
                }
            Spacer()
            VStack {
                ZStack {
                    DefaultProgressBar(page: $page, isOn: $isOn)
                        .frame(width: 300)
                        .offset(y: -UIScreen.height * 0.1)
                    Group {
                        switch CurrentPage.currentPage {
                        case .eye: Text("\(chosenFood.chosenFood.1)는 무슨 색인가요?").lineLimit(1)
                        case .hand: Text("\(chosenFood.chosenFood.1)를 만졌을 때 어떤 느낌인가요?").lineLimit(1)
                        case .ear: Text("\(chosenFood.chosenFood.1)로 어떤 소리를 낼 수 있을까요?")
                            .lineLimit(1)
                        case .nose:
                            Text("\(chosenFood.chosenFood.1)의 냄새를 맡고\n\(chosenDragon.chosenDragon.1)은 어떤 표정을 지을까요?")
                                .multilineTextAlignment(.center)
                        case .mouth: Text("\(chosenDragon.chosenDragon.1)에게 어떤 \(chosenFood.chosenFood.1) 요리를 줄까요?")
                        }
                    }
                    .foregroundColor(.black)
                    .frame(height: UIScreen.height * 0.2, alignment: .top)
                    .offset(y: UIScreen.height * 0.06)
                }
            }
            .font(.cookierun(.regular, size: 28))
            .frame(width: UIScreen.width * 0.6, height: 80)
            Spacer()
            Image(isCleared[CurrentPage.currentPage.rawValue - 1] ? "GoButton" : "DisabledGoButton")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.width * 0.078)
                .onTapGesture {
                    if isCleared[CurrentPage.currentPage.rawValue - 1] {
                        switch CurrentPage.currentPage.rawValue {
                        case 1: CurrentPage.currentPage = .hand
                        case 2: CurrentPage.currentPage = .ear
                        case 3: CurrentPage.currentPage = .nose
                        case 4: CurrentPage.currentPage = .mouth
                        case 5:
                            isDimmed = true
                            withAnimation(.linear(duration: 0.3)) {
                                isPopupActive = true
                            }
                        default:
                            break
                        }
                        if isCleared[0] {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                if page == 5 {
                                } else {
                                    page += 1
                                    isOn[page - 1] = true
                                }
                            }
                        }
                    }
//                    isDimmed = true
                    
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
        NavigationBar(isCleared: .constant([true, true, true, true, true]), isPopupActive: .constant(false), isDimmed: .constant(false))
            .environmentObject(CurrentPageModel())
            .environmentObject(ChosenDragon())
            .environmentObject(ChosenFood())
    }
}
