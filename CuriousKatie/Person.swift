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
    
    init() {
        self.name = faker.name.name()
        self.age = Int.random(in: 10...100)
        self.sex = faker.gender.type()
        self.location = faker.address.city()
        self.interests = Helper.pickSomeInterests()
    }
}
