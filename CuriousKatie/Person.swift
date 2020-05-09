//
//  Person.swift
//  CuriousKatie
//
//  Created by Alexandra Ivanova on 28/04/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import Fakery

class Person {
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
                case (interests.endIndex - 1):
                    interestsConfession += " and \(interest.name)."
                case (interests.endIndex - 2):
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
        var interestConfession = "\(self.name): I'm interested in "
        if sharedInterests.count != interests.count {
            interestConfession += "\((self.interests[sharedInterests.count]).name). It is a \((self.interests[sharedInterests.count]).category) activity. It can be performed \((self.interests[sharedInterests.count]).environment) and it requires "
            for (index, gearItem) in self.interests[sharedInterests.count].gear.enumerated() {
                if self.interests[sharedInterests.count].gear.count == 1 {
                    interestConfession += "\(gearItem.rawValue) "
                } else {
                    switch index {
                    case (self.interests[sharedInterests.count].gear.endIndex - 1):
                        interestConfession += " and \(gearItem.rawValue) "
                    case (self.interests[sharedInterests.count].gear.endIndex - 2):
                        interestConfession += "\(gearItem.rawValue)"
                    default:
                        interestConfession += "\(gearItem.rawValue), "
                    }
                }
            }
            interestConfession += "to be practiced."
            sharedInterests.append(self.interests[sharedInterests.count])
            return interestConfession
        } else {
            return nil
        }
    }
}
