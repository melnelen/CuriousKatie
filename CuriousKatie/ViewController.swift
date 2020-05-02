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
        
        /// Creates a list of random people
        let listOfPeople = Helper.pickSomePeople()
        
        /// Participants introduce themselves
        for person in listOfPeople {
            print(person.introduceMyself())
        }
        
        print("\n")
        
        for person in listOfPeople {
            print(person.shareMyInterests())
        }
    }
}
