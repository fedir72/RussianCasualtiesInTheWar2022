//
//  Category.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 03.07.2022.
//

import Foundation

enum Category: CaseIterable {
    case personnel
    case equipment
}

extension Category {
    func imageName() -> String {
        switch self {
        case .personnel: return "scull"
        case .equipment: return "canon"
        }
    }
    
    func categoryName() -> String {
        switch self {
        case .personnel: return "Personnel".localized()
        case .equipment: return "Equipment".localized()
        }
    }
}
