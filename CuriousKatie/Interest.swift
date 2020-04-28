//
//  Interest.swift
//  CuriousKatie
//
//  Created by Alexandra Ivanova on 28/04/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import Foundation

class Interest {
    let category: String
    let gear: [String]
    let difficulty: String
    let environment: String
    
    init(category: String, gear: [String], difficulty: String, environment: String) {
        self.category = category
        self.gear = gear
        self.difficulty = difficulty
        self.environment = environment
    }
}
