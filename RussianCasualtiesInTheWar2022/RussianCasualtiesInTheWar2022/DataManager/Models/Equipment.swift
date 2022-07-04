//
//  Equipment.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 03.07.2022.
//

import Foundation

struct Equipment: Casualties {
    
    var date: String
    var day: Int
    let aircraft: Int
    let helicopter: Int
    let tank: Int
    let APC: Int
    let fieldArtillery: Int
    let MRL: Int
    let militaryAuto: Int
    let fuelTank: Int
    let drone: Int
    let navalShip: Int
    let antiAircraftWarfare: Int
    let specialEquipment: Int
    let mobileSRBMsystem: Int
    let vehiclesAndFuelTanks: Int
    let cruiseMissiles: Int
    
    func dayOfMonth() -> String {
        guard let i = self.date.split(separator: "-").last else {
            return "1"
        }
        return String(i)
    }
    init(with dictionary: [String:Any]) {
        self.date = dictionary["date"] as? String ?? ""
        self.day = dictionary["day"] as? Int ?? 0
        self.aircraft = dictionary["aircraft"] as? Int ?? 0
        self.helicopter = dictionary["helicopter"] as? Int ?? 0
        self.tank = dictionary["tank"] as? Int ?? 0
        self.APC = dictionary["APC"] as? Int ?? 0
        self.fieldArtillery = dictionary["field artillery"] as? Int ?? 0
        self.MRL = dictionary["MRL"] as? Int ?? 0
        self.militaryAuto = dictionary["military auto"] as? Int ?? 0
        self.fuelTank = dictionary["fuel tank"] as? Int ?? 0
        self.drone = dictionary["drone"] as? Int ?? 0
        self.navalShip = dictionary["naval ship"] as? Int ?? 0
        self.antiAircraftWarfare = dictionary["anti-aircraft warfare"] as? Int ?? 0
        self.specialEquipment = dictionary["special equipment"] as? Int ?? 0
        self.mobileSRBMsystem = dictionary["mobile SRBM system"] as? Int ?? 0
        self.vehiclesAndFuelTanks = dictionary["vehicles and fuel tanks"] as? Int ?? 0
        self.cruiseMissiles = dictionary["cruise missiles"] as? Int ?? 0
    }
    
}

/*{
    "date": "2022-05-31",
    "day": 97,
    "aircraft": 208,
    "helicopter": 174,
    "tank": 1358,
    "APC": 3302,
    "field artillery": 649,
    "MRL": 207,
    "military auto": NaN,
    "fuel tank": NaN,
    "drone": 515,
    "naval ship": 13,
    "anti-aircraft warfare": 93,
    "special equipment": 48,
    "mobile SRBM system": NaN,
    "vehicles and fuel tanks": 2275,
    "cruise missiles": 120
}*/
