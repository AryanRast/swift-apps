//
//  ViewController.swift
//  tamagotchi.app
//
//  Created by Rastogi, Aryan (WING) on 14/01/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tamagotchiStats: UILabel!
    
    var tamagotchi = Tamagotchi(age: 0, weight: 25, happiness: 5, gender: "male", height: 2, name: "Maurice", hunger: 5, health: "ok")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tamagotchiStats.text = tamagotchi.displayStats()
    }
    
    @IBAction func feedButton(_ sender: Any) {
        if tamagotchi.hunger > 0 {
            tamagotchi.hunger -= 1
            tamagotchi.height += 1
            tamagotchiStats.text = tamagotchi.displayStats()
        }
        
        
    }
    
    @IBAction func playButton(_ sender: Any) {
    }
    
    @IBAction func restButton(_ sender: Any) {
    }
    @IBAction func exerciseButton(_ sender: Any) {
    }
    
}

