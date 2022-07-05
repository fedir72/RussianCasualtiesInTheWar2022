//
//  Extensions.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 04.07.2022.
//

import Foundation

extension Int {
    func fixZeroValue() -> String {
        if self == 0 {
            return "no data".localized()
        } else {
            return "\(self)"
        }
    }
}

extension String {
    func localized() -> String {
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}
