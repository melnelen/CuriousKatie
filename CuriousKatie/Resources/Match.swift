//
//  Match.swift
//  CuriousKatie
//
//  Created by Alexandra Ivanova on 20/05/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import Foundation

class Match {
    let seeker: Person
    let partner: Person
    let score: Int
    
    init(seeker: Person, partner: Person) {
        self.seeker = seeker
        self.partner = partner
        self.score = Match.calculateScore(between: seeker, and: partner)
    }
    
    /// Calculating the matching score between two people by counting the number of different interests that they have
    /// - Parameter seeker: the Person seeking for a partner
    /// - Parameter partner: the potential partner Person
    private static func calculateScore(between seeker: Person, and partner: Person) -> Int {
        let seekersInterests = seeker.interests.map { $0.name }
        let partnersInterests = partner.interests.map { $0.name }
        let differentInterests = seekersInterests.difference(from: partnersInterests)
        return differentInterests.count
    }
}
