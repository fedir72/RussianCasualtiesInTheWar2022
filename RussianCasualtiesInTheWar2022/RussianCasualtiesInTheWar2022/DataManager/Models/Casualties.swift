//
//  Casualties.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 04.07.2022.
//

import Foundation

protocol Casualties {
    var date: String { get }
    var day: Int { get }
    func dateArray() -> [Int]
    func detailText() -> String
}

