//
//  Match.swift
//  CuriousKatie
//
//  Created by Alexandra Ivanova on 20/05/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import Foundation

class Match: Equatable {
    let seeker: Person
    let partner: Person
    let score: Int
    
    init(seeker: Person, partner: Person) {
        self.seeker = seeker
        self.partner = partner
        self.score = Match.calculateScore(between: seeker, and: partner)
    }
    
    /// Compare two matches by using their unique seeker and partner matching pair.
    /// - Parameter lhs: compare this Match
    /// - Parameter rhs: to this Match
    static func == (lhs: Match, rhs: Match) -> Bool {
        return lhs.seeker == rhs.seeker && lhs.partner == rhs.partner
    }
    
    /// Calculating the matching score between two people by counting the number of different interests that they have.
    /// - Parameter seeker: Person seeking for a partner
    /// - Parameter partner: Potential partner
    /// - Returns: Matching score
    private static func calculateScore(between seeker: Person, and partner: Person) -> Int {
        let seekersInterests = seeker.interests.map { $0.name }
        let partnersInterests = partner.interests.map { $0.name }
        let differentInterests = seekersInterests.difference(from: partnersInterests)
        
        return differentInterests.count
    }
    
    /// Find the best matching pairs group from an array of People.
    /// The best pairs are determined by how high is the combined score of all the possible matches in the array of People.
    /// The group with the highest score is the one with the best matches.
    /// - Parameter participants: Array of People participating
    /// - Returns: Best matching pairs group
    static func bestMatches(from participants: [Person]) -> [Match] {
        var maxGroupScore = 0
        var bestGroupOfMatches = [Match]()
        let allPossibleMatches = Helper.possibleCombinations(participants, taking: 2)
                                .map {pair in Match(seeker: pair[0], partner: pair[1])}
        
        // Create all possible groups of matches
        for index in 0..<allPossibleMatches.count {
            var groupScore = 0
            var iterations = index
            var possibleGroup = [Match]()
            var matches = allPossibleMatches

            // Choose a match and remove all other matches with
            // duplicating participants
            while matches.count != 0 {
                iterations = checkIndex(matches, index)
                let match = matches[iterations]
                possibleGroup.append(match)
                matches = matches.filter({$0.seeker != match.seeker
                                    && $0.seeker != match.partner
                                    && $0.partner != match.partner
                                    && $0.partner != match.seeker})
            }

            // Choose the best group of matches
            groupScore = possibleGroup.reduce(0, {$0 + $1.score})
            if maxGroupScore < groupScore {
                maxGroupScore = groupScore
                bestGroupOfMatches = possibleGroup
            }
        }
        
        print("This group has a matching score of \(maxGroupScore)/\(bestGroupOfMatches.count * 20).")
        print("\n")
        
        return bestGroupOfMatches
    }
    
    /// Check if the index is out of the array.
    /// - Parameter size: Array size
    /// - Parameter index: Array index
    /// - Returns: Either the index or in case the index is outside the array size - the last index
    private static func checkIndex(_ matches: [Match], _ index: Int) -> Int {
        var iterations = index
        
        if matches.count <= index {
            let bestMatchScore = matches.map {$0.score}.max()
            iterations = matches.firstIndex(where: {$0.score == bestMatchScore})!
        }
        
        return iterations
    }
}
