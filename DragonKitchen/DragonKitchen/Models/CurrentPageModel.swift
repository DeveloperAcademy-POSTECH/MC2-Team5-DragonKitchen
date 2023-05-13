//
//  CurrentPageModel.swift
//  DragonKitchen
//
//  Created by 박상원 on 2023/05/11.
//

import Foundation

enum PageName: Int {
    case eye = 1
    case hand = 2
    case ear = 3
    case nose = 4
    case mouth = 5
}

class CurrentPageModel: ObservableObject {
    @Published var currentPage: PageName = .eye
}
