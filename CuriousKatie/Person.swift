//
//  Person.swift
//  CuriousKatie
//
//  Created by Alexandra Ivanova on 28/04/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import Foundation
import Fakery

class Person {
    
    let name: String
    let age: Int
    let sex: String
    let location: String
//    let interest: Interest
    
    let faker = Faker(locale: "en")
    
    init(name: String, age: Int, sex: String, location: String, interest: Interest) {
        self.name = faker.name.name()
        self.age = Int.random(in: 10...100)
        self.sex = faker.gender.type()
        self.location = faker.address.city()
//        self.interest =
    }
}
