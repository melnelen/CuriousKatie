//
//  Helper.swift
//  CuriousKatie
//
//  Created by Alexandra Ivanova on 30/04/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import Foundation

struct Helper {
    
    static let maximumNumberOfInterestsPerPerson = 10
    static let minimumNumberOfParticipants = 2
    static let maximumNumberOfParticipants = 12
    
    static let allInterests = generateAllInterests()
    static var allPeople = generateAllPeople()
    
    /// Generate all the interests
    static func generateAllInterests() -> [Interest] {
        return[
            Interest(name: "acting", category: Category.art, gear: [Gear.noGear], environment: Environment.anywhere),
            Interest(name: "aerial acrobatics", category: Category.sport, gear: [Gear.sportClothes], environment: Environment.indoor),
            Interest(name: "astronomy", category: Category.science, gear: [Gear.optical, Gear.photo], environment: Environment.outdoor),
            Interest(name: "bike touring", category: Category.sport, gear: [Gear.ecoTransport], environment: Environment.outdoor),
            Interest(name: "board games", category: Category.social, gear: [Gear.noGear], environment: Environment.indoor),
            Interest(name: "calligraphy", category: Category.art, gear: [Gear.painting], environment: Environment.indoor),
            Interest(name: "camping", category: Category.social, gear: [Gear.camping], environment: Environment.outdoor),
            Interest(name: "chess", category: Category.sport, gear: [Gear.noGear], environment: Environment.indoor),
            Interest(name: "computer games", category: Category.sport, gear: [Gear.highTech], environment: Environment.indoor),
            Interest(name: "cooking", category: Category.art, gear: [Gear.noGear], environment: Environment.indoor),
            Interest(name: "cycling", category: Category.sport, gear: [Gear.ecoTransport], environment: Environment.outdoor),
            Interest(name: "dancing", category: Category.social, gear: [Gear.noGear], environment: Environment.anywhere),
            Interest(name: "fitness", category: Category.sport, gear: [Gear.sportClothes], environment: Environment.anywhere),
            Interest(name: "football", category: Category.sport, gear: [Gear.sportClothes], environment: Environment.outdoor),
            Interest(name: "gardening", category: Category.art, gear: [Gear.noGear], environment: Environment.outdoor),
            Interest(name: "hiking", category: Category.sport, gear: [Gear.sportClothes, Gear.runningShoes, Gear.backpack, Gear.camping], environment: Environment.outdoor),
            Interest(name: "horseback riding", category: Category.sport, gear: [Gear.protection], environment: Environment.outdoor),
            Interest(name: "indoor climbing", category: Category.sport, gear: [Gear.protection], environment: Environment.indoor),
            Interest(name: "kayaking", category: Category.sport, gear: [Gear.swimwear], environment: Environment.outdoor),
            Interest(name: "kickboxing", category: Category.sport, gear: [Gear.protection], environment: Environment.indoor),
            Interest(name: "martial arts", category: Category.sport, gear: [Gear.protection], environment: Environment.indoor),
            Interest(name: "paragliding", category: Category.sport, gear: [Gear.flying], environment: Environment.outdoor),
            Interest(name: "philosophy", category: Category.science, gear: [Gear.noGear], environment: Environment.anywhere),
            Interest(name: "photography", category: Category.art, gear: [Gear.photo], environment: Environment.anywhere),
            Interest(name: "programming", category: Category.science, gear: [Gear.highTech], environment: Environment.indoor),
            Interest(name: "rock climbing", category: Category.sport, gear: [Gear.protection], environment: Environment.outdoor),
            Interest(name: "running", category: Category.sport, gear: [Gear.sportClothes, Gear.runningShoes], environment: Environment.outdoor),
            Interest(name: "skiing", category: Category.sport, gear: [Gear.winterClothes, Gear.skiing], environment: Environment.outdoor),
            Interest(name: "skydiving", category: Category.sport, gear: [Gear.flying], environment: Environment.outdoor),
            Interest(name: "snowboarding", category: Category.sport, gear: [Gear.winterClothes, Gear.snowboarding], environment: Environment.outdoor),
            Interest(name: "surfing", category: Category.sport, gear: [Gear.swimwear], environment: Environment.outdoor),
            Interest(name: "swimming", category: Category.sport, gear: [Gear.swimwear], environment: Environment.anywhere),
            Interest(name: "traveling", category: Category.social, gear: [Gear.backpack, Gear.photo], environment: Environment.outdoor),
            Interest(name: "watching movies", category: Category.social, gear: [Gear.noGear], environment: Environment.indoor),
            Interest(name: "writing", category: Category.art, gear: [Gear.noGear], environment: Environment.anywhere),
            Interest(name: "yoga", category: Category.sport, gear: [Gear.sportClothes], environment: Environment.anywhere)]
    }
    
    /// Generate all the people
    static func generateAllPeople() -> [Person] {
        return [
            Person(),
            Person(),
            Person(),
            Person(),
            Person(),
            Person(),
            Person(),
            Person(),
            Person(),
            Person(),
            Person(),
            Person()]
    }
    
    /// Shuffle interests and pick a random amount between 1 and the maximum number of interests per person
    /// *Note: in case the number of interests is smaller than maximum number of interests per person return at least the available number of interests
    /// - Returns: Array of random iterests
    static func pickSomeInterests() -> [Interest] {
        if allInterests.count >= maximumNumberOfInterestsPerPerson {
            return Array(allInterests.shuffled().prefix(Int.random(in: 1...maximumNumberOfInterestsPerPerson)))
        } else {
            return Array(allInterests.shuffled().prefix(Int.random(in: 1...allInterests.count)))
        }
    }
    
    /// Shuffle people and pick a random amount between the minimum number of participants and the maximum number of participants
    /// while ensuring there are no duplications in the names of the participants
    /// *Note: in case the number of people is smaller than maximum number of participants return at least the available number of participants
    /// - Returns: Array of people ready to participate
    static func pickSomePeople() -> [Person] {
        while thereAreDuplicateNames(in: allPeople) {
            allPeople = generateAllPeople()
        }
        
        if allPeople.count >= maximumNumberOfParticipants {
            return Array(allPeople.shuffled().prefix(Int.random(in: minimumNumberOfParticipants...maximumNumberOfParticipants)))
        } else {
            return Array(allPeople.shuffled().prefix(Int.random(in: minimumNumberOfParticipants...allPeople.count)))
        }
    }
    
    /// Checking if there are duplications in names in an array of people
    /// - Parameter people: An array of type Person
    /// - Returns: True if there is one or more duplications
    static func thereAreDuplicateNames(in people: [Person]) -> Bool {
        let duplicates = Dictionary(grouping: people, by: { $0.name }).filter { $1.count > 1 }.keys
        
        return duplicates.count >= 1
    }
    
    /// Check if all participants have been matched. If not ret
    /// - Parameter matches: Array of matches
    /// - Parameter participants: Array of people participating in the game
    /// - Returns: A lonely participant if there is one. If there is none - returns nil
    static func checkForLonelyParticipant(in matches: [Match], from participants: [Person]) -> Person? {
        let matchedParticipants = Set(matches.map {match in [match.seeker, match.partner]}.flatMap {$0})
        let lonelyParticipants = matchedParticipants.symmetricDifference(Set(participants))
        
        return lonelyParticipants.first
    }
    
    /// Given an array of elements and how many of them we are taking, returns an array with all possible combinations
    /// without repetition. Please note that as repetition is not allowed, taking must always be less or equal to`elements.count`.
    /// - Parameter elements: Array to combine
    /// - Parameter taking: Picking item count from array
    /// - Returns: Returns combinations of elements without repetition
    static func possibleCombinations<T>(_ elements: [T], taking: Int) -> [[T]] {
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
