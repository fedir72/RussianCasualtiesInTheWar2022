//
//  Personnel.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 03.07.2022.
//

import Foundation

struct Personnel: Casualties {
   var date: String
   var day: Int
   let personnel: Int
   let personnelDescripton: String
   let POW: Int
    
    func dayOfMonth() -> String {
        guard let i = self.date.split(separator: "-").last else {
            return "1"
        }
        return String(i)
    }
    
    init(with dictionary: [String:Any]) {
        self.date = dictionary["date"] as? String ?? ""
        self.day = dictionary["day"] as? Int ?? 0
        self.personnel = dictionary["personnel"] as? Int ?? 0
        self.personnelDescripton = dictionary["personnel*"] as? String ?? ""
        self.POW = dictionary["POW"] as? Int ?? 0
    }
}

/*{
    "date": "2022-03-11",
    "day": 16,
    "personnel": 12000,
    "personnel*": "more",
    "POW": 389
}*/
