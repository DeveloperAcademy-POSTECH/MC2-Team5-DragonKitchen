//
//  NavigateModel.swift
//  DragonKitchen
//
//  Created by 박상원 on 2023/05/18.
//

import Foundation

class NavigateModel: ObservableObject {
    // 파프리카만 나오도록 변경
    @Published var navigateFood: Bool = true
    @Published var navigateBook: Bool = false
    @Published var isArrowAnimating: Bool = false
}
