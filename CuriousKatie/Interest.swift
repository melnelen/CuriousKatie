//
//  Interest.swift
//  CuriousKatie
//
//  Created by Alexandra Ivanova on 28/04/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

class Interest {
    /// Properties of the Interest object.
    let name: String
    let category: Category
    let gear: [Gear]
    let environment: Environment
    
    /// Initialize an instance of an Interest object with the given data.
    init(name: String, category: Category, gear: [Gear], environment: Environment) {
        self.name = name
        self.category = category
        self.gear = gear
        self.environment = environment
    }
    
    /// Share this interest
    /// - Parameter interest: an instance of Interest
    static func share(_ interest: Interest) -> String {
        var interestConfession = ""
        interestConfession += "\(interest.name). It is a \(interest.category) activity. It can be performed \(interest.environment) and it requires "
        interestConfession += shareGearRequired(for: interest)
        interestConfession += "to be practiced."
        return interestConfession
    }
    
    /// Share a list of gear required for this interest
    /// - Parameter interest: an instance of Interest
    static func shareGearRequired(for interest: Interest) -> String {
        var gearRequired = ""
        for (index, gearItem) in interest.gear.enumerated() {
            if interest.gear.count == 1 {
                gearRequired += "\(gearItem.rawValue) "
            } else {
                switch index {
                case (interest.gear.endIndex - 1):
                    gearRequired += " and \(gearItem.rawValue) "
                case (interest.gear.endIndex - 2):
                    gearRequired += "\(gearItem.rawValue)"
                default:
                    gearRequired += "\(gearItem.rawValue), "
                }
            }
        }
        return gearRequired
    }
}
