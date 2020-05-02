//
//  Person.swift
//  CuriousKatie
//
//  Created by Alexandra Ivanova on 28/04/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import Fakery

class Person {
    
    var name: String
    let age: Int
    let sex: String
    let location: String
    let interests: [Interest]
    
    let faker = Faker(locale: "en")
    
    /// Initialize a Person object with some fake data
    init() {
        self.name = faker.name.name()
        self.age = Int.random(in: 10...100)
        self.sex = String.lowercased(faker.gender.type())()
        self.location = "\(faker.address.city()), \(faker.address.country())"
        self.interests = Helper.pickSomeInterests()
    }
    
    /// Creates an introduction message
    func introduceMyself() -> String {
        return "Hello, my name is \(self.name). I'm a \(self.age) years old \(self.sex) and I live in \(self.location)."
    }
}
