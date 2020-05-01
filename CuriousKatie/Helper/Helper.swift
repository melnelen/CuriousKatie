//
//  Helper.swift
//  CuriousKatie
//
//  Created by Alexandra Ivanova on 30/04/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import Foundation

struct Helper {
    /// Generate all the interests
    static func generateAllInterests() -> [Interest] {
        
        let interest01 = Interest(name: "acting", category: Category.art, gear: [Gear.noGear], environment: Environment.anywhere)
        let interest02 = Interest(name: "aerial acrobatics", category: Category.sport, gear: [Gear.sportClothes], environment: Environment.indoor)
        let interest03 = Interest(name: "astronomy", category: Category.science, gear: [Gear.optical, Gear.photo], environment: Environment.outdoor)
        let interest04 = Interest(name: "bike touring", category: Category.sport, gear: [Gear.ecoTransport], environment: Environment.outdoor)
        let interest05 = Interest(name: "board games", category: Category.social, gear: [Gear.noGear], environment: Environment.indoor)
        let interest06 = Interest(name: "calligraphy", category: Category.art, gear: [Gear.painting], environment: Environment.indoor)
        let interest07 = Interest(name: "camping", category: Category.social, gear: [Gear.camping], environment: Environment.outdoor)
        let interest08 = Interest(name: "chess", category: Category.sport, gear: [Gear.noGear], environment: Environment.indoor)
        let interest09 = Interest(name: "cooking", category: Category.art, gear: [Gear.noGear], environment: Environment.indoor)
        let interest10 = Interest(name: "cycling", category: Category.sport, gear: [Gear.ecoTransport], environment: Environment.outdoor)
        let interest11 = Interest(name: "dancing", category: Category.social, gear: [Gear.noGear], environment: Environment.anywhere)
        let interest12 = Interest(name: "fitness", category: Category.sport, gear: [Gear.sportClothes], environment: Environment.anywhere)
        let interest13 = Interest(name: "football", category: Category.sport, gear: [Gear.sportClothes], environment: Environment.outdoor)
        let interest14 = Interest(name: "gardening", category: Category.art, gear: [Gear.noGear], environment: Environment.outdoor)
        let interest15 = Interest(name: "hiking", category: Category.sport, gear: [Gear.sportClothes, Gear.runningShoes, Gear.backpack, Gear.camping], environment: Environment.outdoor)
        let interest16 = Interest(name: "horseback riding", category: Category.sport, gear: [Gear.protection], environment: Environment.outdoor)
        let interest17 = Interest(name: "indoor climbing", category: Category.sport, gear: [Gear.protection], environment: Environment.indoor)
        let interest18 = Interest(name: "kayaking", category: Category.sport, gear: [Gear.swimwear], environment: Environment.outdoor)
        let interest19 = Interest(name: "kickboxing", category: Category.sport, gear: [Gear.protection], environment: Environment.indoor)
        let interest20 = Interest(name: "martial arts", category: Category.sport, gear: [Gear.protection], environment: Environment.indoor)
        let interest21 = Interest(name: "paragliding", category: Category.sport, gear: [Gear.flying], environment: Environment.outdoor)
        let interest22 = Interest(name: "philosophy", category: Category.science, gear: [Gear.noGear], environment: Environment.anywhere)
        let interest23 = Interest(name: "photography", category: Category.art, gear: [Gear.photo], environment: Environment.anywhere)
        let interest24 = Interest(name: "playing computer games", category: Category.sport, gear: [Gear.highTech], environment: Environment.indoor)
        let interest25 = Interest(name: "programming", category: Category.science, gear: [Gear.highTech], environment: Environment.indoor)
        let interest26 = Interest(name: "rock climbing", category: Category.sport, gear: [Gear.protection], environment: Environment.outdoor)
        let interest27 = Interest(name: "running", category: Category.sport, gear: [Gear.sportClothes, Gear.runningShoes], environment: Environment.outdoor)
        let interest28 = Interest(name: "skiing", category: Category.sport, gear: [Gear.winterClothes, Gear.skiing], environment: Environment.outdoor)
        let interest29 = Interest(name: "skydiving", category: Category.sport, gear: [Gear.flying], environment: Environment.outdoor)
        let interest30 = Interest(name: "snowboarding", category: Category.sport, gear: [Gear.winterClothes, Gear.snowboarding], environment: Environment.outdoor)
        let interest31 = Interest(name: "surfing", category: Category.sport, gear: [Gear.swimwear], environment: Environment.outdoor)
        let interest32 = Interest(name: "swimming", category: Category.sport, gear: [Gear.swimwear], environment: Environment.anywhere)
        let interest33 = Interest(name: "traveling", category: Category.social, gear: [Gear.backpack, Gear.photo], environment: Environment.outdoor)
        let interest34 = Interest(name: "watching movies", category: Category.social, gear: [Gear.noGear], environment: Environment.indoor)
        let interest35 = Interest(name: "writing", category: Category.art, gear: [Gear.noGear], environment: Environment.anywhere)
        let interest36 = Interest(name: "yoga", category: Category.sport, gear: [Gear.sportClothes], environment: Environment.anywhere)
        
        return [interest01,
                interest02,
                interest03,
                interest04,
                interest05,
                interest06,
                interest07,
                interest08,
                interest09,
                interest10,
                interest11,
                interest12,
                interest13,
                interest14,
                interest15,
                interest16,
                interest17,
                interest18,
                interest19,
                interest20,
                interest21,
                interest22,
                interest23,
                interest24,
                interest25,
                interest26,
                interest27,
                interest28,
                interest29,
                interest30,
                interest31,
                interest32,
                interest33,
                interest34,
                interest35,
                interest36]
    }
    
    /// Shuffle interests and pick a random amount between 1 and 10
    static func pickSomeInterests() -> [Interest] {
        let pool = generateAllInterests().shuffled()
        return Array(pool.prefix(Int.random(in: 1...10)))
    }
    
}
