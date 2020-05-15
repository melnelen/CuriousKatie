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
            for (index, person) in participantsWithInterests.enumerated() {
                guard let somethingToShare = person.shareNextInterest() else {
                    participantsWithInterests.remove(at: index)
                    break
                }
                print(somethingToShare)
            }
        }
    }
}
