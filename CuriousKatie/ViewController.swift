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
        while seekingParticipants.count != 0 {
            guard seekingParticipants.count != 1 else {
                let lonelyParticipant = seekingParticipants[0]
                print("\(lonelyParticipant.name) has no partner.")
                seekingParticipants.removeAll { $0.name == lonelyParticipant.name }
                break
            }
            var matchingScore = 0
            var oldMatchingScore = 0
            let seeker = seekingParticipants[0]
            var matchingPartner = seekingParticipants[1]
            for index in 1..<seekingParticipants.count {
                let potentialPartner = seekingParticipants[index]
                matchingScore = Match(seeker: seeker, partner: potentialPartner).score
                if oldMatchingScore < matchingScore {
                    matchingPartner = potentialPartner
                    oldMatchingScore = matchingScore
                }
            }
            if matchingScore == 0 {
                print("\(seeker.name) and \(matchingPartner.name) are not a good match.")
            } else {
            print("\(seeker.name) and \(matchingPartner.name) are a good match with a matching score of \(oldMatchingScore)/20.")
            }
            seekingParticipants.removeAll { $0.name == seeker.name }
            seekingParticipants.removeAll { $0.name == matchingPartner.name }
        }
        
        /// Print a new line to separate sections.
        print("\n")
        
        /// Calculating the best score of all possible pairs combinations
        var maxScore = 0
        for iterations in 0..<participants.count {
            var oldScore = 0
            var seekingParticipants2 = participants
            var seeker = seekingParticipants2[iterations]
            while seekingParticipants2.count != 0 && seekingParticipants2.count != 1 {
                if seekingParticipants2.count < iterations {
                    seeker = seekingParticipants2[0]
                }
                let partner = seekingParticipants2[seekingParticipants2.count - 1]
                oldScore += Match(seeker: seeker, partner: partner).score
                seekingParticipants2.removeAll { $0.name == seeker.name }
                seekingParticipants2.removeAll { $0.name == partner.name }
            }
            if maxScore < oldScore {
                maxScore = oldScore
            }
            print(maxScore)
        }
    }
}
