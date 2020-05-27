//
//  ViewController.swift
//  CuriousKatie
//
//  Created by Alexandra Ivanova on 15/04/2020.
//  Copyright © 2020 Alex Ivanova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Creates a list of random people.
        let participants = Helper.pickSomePeople()
        
        /// Participants introduce themselves
        for person in participants {
            print(person.introduceMyself())
        }
        
        /// Print a new line to separate sections.
        print("\n")
        
        /// All participants share all of their interests.
        for person in participants {
            print(person.shareAllInterests())
        }
        
        /// Print a new line to separate sections.
        print("\n")
        
        /// Each participant shares one of their interests at a time.
        var participantsWithInterests = participants
        while participantsWithInterests.count != 0 {
            participantsWithInterests = participantsWithInterests.shuffled()
            for person in participantsWithInterests {
                guard let somethingToShare = person.shareNextInterest() else {
                    participantsWithInterests.removeAll { $0.name == person.name }
                    break
                }
                print(somethingToShare)
            }
        }
        
        /// Print a new line to separate sections.
        print("\n")
        
        /// Creating better matching pairs of people
        let matches = Match.bestMatches(from: participants)
        for match in matches {
            print("\(match.seeker.name) and \(match.partner.name) are a good match with a matching score of \(match.score)/20.")
        }
    }
}
