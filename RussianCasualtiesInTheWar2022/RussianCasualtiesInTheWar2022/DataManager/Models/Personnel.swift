//
//  Personnel.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 03.07.2022.
//

import Foundation

fileprivate struct Constant {
    static let casualtiesOn = "Casualties in:".localized()
    static let day = "Day of war:".localized()
    static let personnel = "Personnel:".localized()
    static let pow = "POW:".localized()
}

struct Personnel: Casualties {
   var date: String
   var day: Int
   let personnel: Int
   let personnelDescripton: String
   let POW: Int

    func dateArray() -> [Int] {
        self.date.split(separator: "-").compactMap{ Int($0) }
    }
    
    func detailText() -> String {
        return
                """
                \(Constant.casualtiesOn) \(date)
                \(Constant.day) \(day.fixZeroValue())
                \(Constant.personnel) \(personnel.fixZeroValue())
                \(Constant.pow) \(POW.fixZeroValue())
                """
           }
    
    init(with dictionary: [String:Any]) {
        self.date = dictionary["date"] as? String ?? "no data"
        self.day = dictionary["day"] as? Int ?? 0
        self.personnel = dictionary["personnel"] as? Int ?? 0
        self.personnelDescripton = dictionary["personnel*"] as? String ?? "no data"
        self.POW = dictionary["POW"] as? Int ?? 0
    }
}


