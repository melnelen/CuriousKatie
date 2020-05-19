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
        
        /// Creating matching pairs of people
        var seekingParticipants = participants
        var participantsWithoutPartners = participants
        var oldMatchingScore = 0
        var matchingPartner = participants[0]
        while seekingParticipants.count != 0 {
            guard seekingParticipants.count != 1 else {
                let lonelyParticipant = seekingParticipants[0]
                print("\(lonelyParticipant.name) has no partner.")
                seekingParticipants.removeAll { $0.name == lonelyParticipant.name }
                break
            }
            matchingPartner = seekingParticipants[0]
            for seeker in seekingParticipants {
                for potentialPartner in participantsWithoutPartners {
                    let matchingScore = Helper.calculateMatchingScore(between: seeker, and: potentialPartner)
                    if oldMatchingScore < matchingScore {
                        matchingPartner = potentialPartner
                        oldMatchingScore = matchingScore
                    }
                }
                print("\(seeker.name) and \(matchingPartner.name) are a good match.")
                oldMatchingScore = 0
                seekingParticipants.removeAll { $0.name == seeker.name }
                seekingParticipants.removeAll { $0.name == matchingPartner.name }
                participantsWithoutPartners.removeAll { $0.name == seeker.name }
                participantsWithoutPartners.removeAll { $0.name == matchingPartner.name }
                break
            }
        }
    }
}
