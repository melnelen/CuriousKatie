//
//  Person.swift
//  CuriousKatie
//
//  Created by Alexandra Ivanova on 28/04/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import Fakery

class Person: Equatable {
    /// Properties of the Person object.
    var name: String
    let age: Int
    let sex: String
    let location: String
    let interests: [Interest]
    var sharedInterests: [Interest] = []
    
    /// Creating a Faker instance to help with creating some fake data.
    let faker = Faker(locale: "en")
    
    /// Initialize an instance of a Person object with some fake data.
    init() {
        self.name = faker.name.name()
        self.age = Int.random(in: 10...100)
        self.sex = String.lowercased(faker.gender.type())()
        self.location = "\(faker.address.city()), \(faker.address.country())"
        self.interests = Helper.pickSomeInterests()
    }
    
    /// Compare two people by using their unique names
    /// - Parameter lhs: compare this Person
    /// - Parameter rhs: to this Person
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
    
    /// Creates an introduction message.
    func introduceMyself() -> String {
        return "Hello, my name is \(self.name). I'm a \(self.age) years old \(self.sex) and I live in \(self.location)."
    }
    
    /// Have a person share all of their interests.
    func shareAllInterests() -> String {
        var interestsConfession = "\(self.name): I'm interested in "
        
        /// Iterate through all of the person's interests and add them to their confession one by one.
        for (index, interest) in self.interests.enumerated() {
            if interests.count == 1 {
                interestsConfession += "\(interest.name)."
            } else {
                switch index {
                case (self.interests.endIndex - 1):
                    interestsConfession += " and \(interest.name)."
                case (self.interests.endIndex - 2):
                    interestsConfession += "\(interest.name)"
                default:
                    interestsConfession += "\(interest.name), "
                }
            }
        }
        return interestsConfession
    }
    
    /// Share one of the person's interests that hasn't been shared yet
    /// Note: We are sure that the person has at least one interest
    func shareNextInterest() -> String? {
        guard sharedInterests.count != interests.count else {
            return nil
        }
        let nextInterest = self.interests[sharedInterests.count]
        var interestConfession = "\(self.name): I'm interested in "
        interestConfession += "\(nextInterest.name). It is a \(nextInterest.category) activity. It can be performed \(nextInterest.environment) and it requires "
        interestConfession += shareGearRequired(for: nextInterest)
        interestConfession += "to be practiced."
        sharedInterests.append(nextInterest)
        return interestConfession
    }
    
    /// Share a list of gear required for this interest
    /// - Parameter interest: an instance of Interest
    func shareGearRequired(for interest: Interest) -> String {
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
