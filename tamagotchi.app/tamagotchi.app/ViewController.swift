//
//  ViewController.swift
//  tamagotchi.app
//
//  Created by Rastogi, Aryan (WING) on 14/01/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var healthChart = ["Perfect", "Fit", "Healthy", "Ok", "Plumpy", "Obese", "ill", "Near Death", "Death"]
    var i = 4
    
    @IBOutlet var tamagotchiStats: UILabel!
    
    var tamagotchi = Tamagotchi(age: 0, weight: 25, happiness: 5, gender: "male", height: 2, name: "Maurice", hunger: 5, health: "Ok")
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tamagotchiStats.text = tamagotchi.displayStats()
    }
    
    func updateStats() {
        tamagotchi.age += 1
        tamagotchiStats.text = tamagotchi.displayStats()
    }
    
    @IBAction func feedButton(_ sender: Any) {
        if tamagotchi.hunger > 0 {
            tamagotchi.hunger -= 1
            tamagotchi.height += 1
            tamagotchi.weight += 10
        }
        updateStats()
    }
    
    
    @IBAction func playButton(_ sender: Any) {
        //happiness
    }
    
    @IBAction func restButton(_ sender: Any) {
        tamagotchi.weight += 3
        //happines needs to be included
        updateStats()
    }
    
    @IBAction func exerciseButton(_ sender: Any) {
        if tamagotchi.weight > 0 {
            tamagotchi.weight -= 5
        }
        updateStats()
    }

}


