//
//  Interest.swift
//  CuriousKatie
//
//  Created by Alexandra Ivanova on 28/04/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import Foundation

class Interest {
    let name: String
    let category: Category
    let gear: [Gear]
    let environment: Environment
    
    init(name: String, category: Category, gear: [Gear], environment: Environment) {
        self.name = name
        self.category = category
        self.gear = gear
        self.environment = environment
    }
}
