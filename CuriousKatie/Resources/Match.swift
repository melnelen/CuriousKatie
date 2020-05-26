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
    
    /// Finding the best matching pairs combination from an array of People.
    /// The best pairs are determined by how high is the combined score of all the possible matches in the array of People.
    /// The array with the highest combined score is the one with the best matches.
    /// - Parameter participants: Array of People participating
    /// - Returns: Best matching pairs
    static func bestMatches(from participants: [Person]) -> [Match] {
        var maxScore = 0
//        var allMatchesScore = 0
        var bestMatches = [Match]()
        let allPossibleMatches = Match.possibleCombinations(participants, taking: 2)
                                .map {pair in Match(seeker: pair[0], partner: pair[1])}
//        let allPossibleMatchesCombinations = Match.possibleCombinations(allPossibleMatches, taking: participants.count / 2)
//
//        for matchCombinations in allPossibleMatchesCombinations {
//            allMatchesScore = matchCombinations.reduce(0, {$0 + $1.score})
//            if maxScore < allMatchesScore {
//                maxScore = allMatchesScore
//                bestMatches = matchCombinations
//            }
//        }
        
        for index in 0..<allPossibleMatches.count {
            var allMatchesScore = 0
            var iterations = index
            var possibleMatches = [Match]()
            var matches = allPossibleMatches

            while matches.count != 0 {
                iterations = checkIndex(matches, index)
                let match = matches[iterations]
                possibleMatches.append(match)
                matches = matches.filter({$0.seeker != match.seeker
                                    && $0.seeker != match.partner
                                    && $0.partner != match.partner
                                    && $0.partner != match.seeker})
            }

            allMatchesScore = possibleMatches.reduce(0, {$0 + $1.score})
            if maxScore < allMatchesScore {
                maxScore = allMatchesScore
                bestMatches = possibleMatches
            }
        }
        
        print("This group has a matching score of \(maxScore)/\(bestMatches.count * 20).")
        return bestMatches
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
    
    /// Given an array of people and how many of them we are taking, returns an array with all possible pairs combinations.
    /// - Parameter participants: Array of people to combine
    /// - Parameter taking: Picking people count from array
    /// - Returns: Returns combinations of participants pairs without repetition
    public static func possibleCombinations<T>(_ elements: [T], taking: Int) -> [[T]] {
        guard elements.count >= taking else { return [] }
        guard elements.count > 0 && taking > 0 else { return [[]] }
        
        if taking == 1 {
            return elements.map {[$0]}
        }
        
        var combinations = [[T]]()
        for (index, element) in elements.enumerated() {
            var reducedElements = elements
            reducedElements.removeFirst(index + 1)
            combinations += possibleCombinations(reducedElements, taking: taking - 1).map {[element] + $0}
        }
        
        return combinations
    }
}
