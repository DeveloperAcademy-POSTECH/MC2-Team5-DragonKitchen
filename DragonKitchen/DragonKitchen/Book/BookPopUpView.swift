//
//  BookPopUpView.swift
//  DragonKitchen
//
//  Created by 허준혁 on 2023/05/13.
//

import SwiftUI

struct BookPopUpView: View{
    @Binding var isPresenting: Bool
    @Binding var selectedVegiIllust: String
    @Binding var selectedVegiName: String

    var body: some View{
        VStack{
            Image(selectedVegiIllust)
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack{
                Text("이엘이랑 \(selectedVegiName) 요리를 먹었어요!")
                    .font(.title2)
                Image(systemName: "xmark")
                    .onTapGesture{
                        isPresenting = false
                    }
            }
        }
    }
}
