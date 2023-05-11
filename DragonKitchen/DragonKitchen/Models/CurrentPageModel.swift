//
//  CurrentPageModel.swift
//  DragonKitchen
//
//  Created by 박상원 on 2023/05/11.
//

import Foundation

enum PageName: Int {
    case Eye = 1
    case Hand = 2
    case Ear = 3
    case Nose = 4
    case Mouth = 5
}

class CurrentPageModel: ObservableObject {
    @Published var CurrentPage: PageName = .Eye
}
