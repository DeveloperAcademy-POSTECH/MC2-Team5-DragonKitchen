//
//  TestView.swift
//  DinoDina
//
//  Created by 박상원 on 2023/05/10.
//

import SwiftUI

struct TestView: View {
    @State var page = 1
    @State var pageText = 1
    @State var isCleared = true
    var body: some View {
        ZStack {
            VStack {
                NavigationTest(page: $page, pageText: $pageText, isCleared: $isCleared)
                Spacer()
            }
            .frame(width: UIScreen.width)
            .zIndex(1)

            switch pageText {
            case 1: TasteView()
            case 2: MainView().environmentObject(gageVariables())
                    .environmentObject(ChosenFood())
            case 3: Text("3")
            case 4: Text("4")
            case 5: Text("5")
            default: Text("MainView")
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
