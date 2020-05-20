//
//  Match.swift
//  CuriousKatie
//
//  Created by Alexandra Ivanova on 20/05/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import Foundation

class Match {
    /// Calculating the matching score between two people by counting the number of different interests that they have
    /// - Parameter seeker: the Person seeking for a partner
    /// - Parameter potentialPartner: the potential partner Person
    static func calculateMatchingScore(between seeker: Person, and potentialPartner: Person) -> Int {
        let seekersInterests = seeker.interests.map { $0.name }
        let potentialPartnersInterests = potentialPartner.interests.map { $0.name }
        let differentInterests = seekersInterests.difference(from: potentialPartnersInterests)
        return differentInterests.count
    }
}
