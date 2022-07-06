//
//  Equipment.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 03.07.2022.
//

import Foundation

private struct Constant {
    static let date = "date".localized()
    static let day = "day".localized()
    static let aircraft = "aircraft".localized()
    static let helicopter = "helicopter".localized()
    static let tank = "tank".localized()
    static let APC = "APC".localized()
    static let fieldArtillery = "field artillery".localized()
    static let MLR = "MRL".localized()
    static let militaryAuto = "military auto".localized()
    static let fuelTank = "fuel tank".localized()
    static let drone = "drone".localized()
    static let navalShip = "naval ship".localized()
    static let aircraftVarfare = "anti-aircraft warfare".localized()
    static let specialEquipment = "special equipment".localized()
    static let mobileSRMsystem = "mobile SRBM system".localized()
    static let vewiclesAndFuelTanks = "vehicles and fuel tanks".localized()
    static let cruiseMissile = "cruise missiles".localized()
}

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
    
    func dateArray() -> [Int] {
        self.date.split(separator: "-").compactMap{ Int($0) }
    }
    
    func detailText() -> String {
        return
            """
            \(Constant.date) \(date)
            \(Constant.day) \(day.fixZeroValue())
            \(Constant.aircraft) \(aircraft.fixZeroValue())
            \(Constant.helicopter) \(helicopter.fixZeroValue())
            \(Constant.tank) \(tank.fixZeroValue())
            \(Constant.APC) \(APC.fixZeroValue())
            \(Constant.fieldArtillery) \(fieldArtillery.fixZeroValue())
            \(Constant.MLR) \(MRL.fixZeroValue())
            \(Constant.militaryAuto) \(militaryAuto.fixZeroValue())
            \(Constant.fuelTank) \(fuelTank.fixZeroValue())
            \(Constant.drone) \(drone.fixZeroValue())
            \(Constant.navalShip) \(navalShip.fixZeroValue())
            \(Constant.aircraftVarfare) \(antiAircraftWarfare.fixZeroValue())
            \(Constant.specialEquipment) \(specialEquipment.fixZeroValue())
            \(Constant.mobileSRMsystem) \(mobileSRBMsystem.fixZeroValue())
            \(Constant.vewiclesAndFuelTanks) \(vehiclesAndFuelTanks.fixZeroValue())
            \(Constant.cruiseMissile) \(cruiseMissiles.fixZeroValue())
            """
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

