//
//  Interest.swift
//  CuriousKatie
//
//  Created by Alexandra Ivanova on 28/04/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

class Interest: Equatable {
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
    
    /// Compare two interests by using their unique names
    /// - Parameter lhs: compare this Interest
    /// - Parameter rhs: to this Interest
    static func == (lhs: Interest, rhs: Interest) -> Bool {
        return lhs.name == rhs.name
    }
    
    /// Share this interest
    /// - Parameter interest: an instance of Interest
    /// - Returns: A string describing the interest including it's name, category, enviro
    func share() -> String {
        var interestConfession = ""
        
        interestConfession += "\(self.name). It is a \(self.category) activity. It can be performed \(self.environment) and it requires "
        interestConfession += shareGearRequired()
        interestConfession += "to be practiced."
        
        return interestConfession
    }
    
    /// Share a list of gear required for this interest
    /// - Parameter interest: an instance of Interest
    /// - Returns: A string with a list of gear items
    func shareGearRequired() -> String {
        var gearRequired = ""
        
        for (index, gearItem) in self.gear.enumerated() {
            
            if self.gear.count == 1 {
                gearRequired += "\(gearItem.rawValue) "
            } else {
                
                switch index {
                case (self.gear.endIndex - 1):
                    gearRequired += " and \(gearItem.rawValue) "
                case (self.gear.endIndex - 2):
                    gearRequired += "\(gearItem.rawValue)"
                default:
                    gearRequired += "\(gearItem.rawValue), "
                }
            }
        }
        
        return gearRequired
    }
}
