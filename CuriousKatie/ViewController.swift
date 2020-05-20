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
            var seeker = seekingParticipants[0]
            var matchingPartner = seekingParticipants[1]
            for index in 0..<seekingParticipants.count - 1 {
                seeker = seekingParticipants[index]
                for index in 1..<seekingParticipants.count {
                    let potentialPartner = seekingParticipants[index]
                    matchingScore = Helper.calculateMatchingScore(between: seeker, and: potentialPartner)
                    if oldMatchingScore < matchingScore {
                        matchingPartner = potentialPartner
                        oldMatchingScore = matchingScore
                    }
                }
                guard matchingScore != 0 else {
                    print("\(seeker.name) and \(matchingPartner.name) are not a good match.")
                    seekingParticipants.removeAll { $0.name == seeker.name }
                    seekingParticipants.removeAll { $0.name == matchingPartner.name }
                    break
                }
                print("\(seeker.name) and \(matchingPartner.name) are a good match with a matching score of \(matchingScore)/20.")
                seekingParticipants.removeAll { $0.name == seeker.name }
                seekingParticipants.removeAll { $0.name == matchingPartner.name }
                break
            }
        }
    }
}
