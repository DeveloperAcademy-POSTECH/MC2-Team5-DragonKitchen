//
//  NavigationBar.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/09.
//

import SwiftUI

struct NavigationBar: View {
    @State var page: Int = 1
    @State var isOn = [true, false, false, false, false]
    var body: some View {
        HStack {
            Image("BackButton")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.width * 0.078)
                .onTapGesture {
                    withAnimation(.linear(duration: 1)) {
                        page -= 1
                        isOn[page-1] = false
                    }
                }
            Spacer()
            VStack {
                ProgressBar(page: $page, isOn: $isOn)
                    .frame(width: 200)
                Text("파프리카를 만졌을 때 어떤 느낌인가요?").lineLimit(1).font(.system(size: 30))
            }.fixedSize()
            Spacer()
            Image("GoButton")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.width * 0.078)
                .onTapGesture {
                    withAnimation(.linear(duration: 1)) {
                        page += 1
                        isOn[page-1] = true
                    }
                }
        }
    }
}

struct ProgressBar: View {
    @Binding var page: Int
    @Binding var isOn: [Bool]
    var body: some View {
        HStack(spacing: 0) {
            UnselectedCircle()
                .foregroundColor(isOn[0] ? .ProgressBarColor : .disabledProgressBarColor)
            UnselectedRectangle()
                .foregroundColor(isOn[1] ? .ProgressBarColor : .disabledProgressBarColor)
            UnselectedCircle()
                .foregroundColor(isOn[1] ? .ProgressBarColor : .disabledProgressBarColor)
            UnselectedRectangle()
                .foregroundColor(isOn[2] ? .ProgressBarColor : .disabledProgressBarColor)
            UnselectedCircle()
                .foregroundColor(isOn[2] ? .ProgressBarColor : .disabledProgressBarColor)
            UnselectedRectangle()
                .foregroundColor(isOn[3] ? .ProgressBarColor : .disabledProgressBarColor)
            UnselectedCircle()
                .foregroundColor(isOn[3] ? .ProgressBarColor : .disabledProgressBarColor)
            UnselectedRectangle()
                .foregroundColor(isOn[4] ? .ProgressBarColor : .disabledProgressBarColor)
            UnselectedCircle()
                .foregroundColor(isOn[4] ? .ProgressBarColor : .disabledProgressBarColor)
        }
    }
}

struct UnselectedCircle: View {
    var body: some View {
        Circle()
            .frame(width: UIScreen.width * 0.0178)
    }
}

struct UnselectedRectangle: View {
    var body: some View {
        Rectangle()
            .frame(width: UIScreen.width * 0.04, height: 2)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
