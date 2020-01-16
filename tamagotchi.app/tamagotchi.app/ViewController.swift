//
//  ViewController.swift
//  tamagotchi.app
//
//  Created by Rastogi, Aryan (WING) on 14/01/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var healthChart = ["God level", "Perfect", "Fit", "Healthy", "Ok", "Unwell", "Not good", "ill", "Severely ill", "Near Death", "Death"]
    var stateChart = ["Fresh", "Clean", "Ok", "Bearable", "Smelly", "Unbearable", "slob", "covered in mould"]
    var age = 0
    var i = 3
    var j = 3
    var score = 0.0
    
    @IBOutlet var tamagotchiStats: UILabel!
    @IBOutlet var ageDisplay: UILabel!
    @IBOutlet var idealWeightDisplay: UILabel!
    @IBOutlet var nameDisplay: UILabel!
    @IBOutlet var pointsDisplay: UILabel!
    
    var tamagotchi = Tamagotchi(weight: 30, happiness: 5, state: "bearable", height: 2, name: "Maurice", hunger: 5, health: "Ok")
    
    var timer: Timer?
    var idealWeight = 40

    override func viewDidLoad() {
        super.viewDidLoad()
        tamagotchiStats.text = tamagotchi.displayStats()
        timer = Timer.scheduledTimer(timeInterval: 7, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        ageDisplay.text = "age: \(age) days"
        idealWeightDisplay.text = "Ideal weight: \(idealWeight)kg"
        nameDisplay.text = "\(tamagotchi.name)"
        pointsDisplay.text = "\(score)"
    }
    
    func death() {
    }
    
    func updateStats() {
        if tamagotchi.weight < 0 {
            tamagotchi.weight = 0
        }
        tamagotchi.state = stateChart[j]
        tamagotchi.health = healthChart[i]
        idealWeightDisplay.text = "Ideal weight: \(idealWeight)kg"
        tamagotchiStats.text = tamagotchi.displayStats()
        pointsDisplay.text = "\(score)"
    
    }
    @IBAction func medicateButton(_ sender: Any) {
        if i > 0 {
            i -= 1
        }
        if j < stateChart.count - 2 {
            j += 2
        }
            
        
        updateStats()
        
    }
    
    @IBAction func snackButton(_ sender: Any) {
        tamagotchi.height += 0.5
        tamagotchi.weight += 3
        
        if tamagotchi.hunger > 0 {
            tamagotchi.hunger -= 1
            
        }
        updateStats()
    }
    
 
    @IBAction func playButton(_ sender: Any) {
        if tamagotchi.happiness < 10 {
            tamagotchi.happiness += 1
        }
        tamagotchi.weight -= 3
        if j < stateChart.count - 1 {
            j += 1
        }
        
        updateStats()
    }
    
    @IBAction func mealButton(_ sender: Any) {
        tamagotchi.weight += 20
        tamagotchi.height += 1
        if tamagotchi.hunger >= 2 {
            tamagotchi.hunger -= 2
        }
        //happines needs to be included
        updateStats()
    }
    
    @IBAction func cleanButton(_ sender: Any) {
        if j > 0 {
            j -= 1
        }
        updateStats()
    }
    
    @IBAction func exerciseButton(_ sender: Any) {
        if tamagotchi.weight >= 3 {
            tamagotchi.weight -= 3
            if tamagotchi.hunger < 10 {
                tamagotchi.hunger += 1
            }
        }
        updateStats()
    }
    
    @objc func countdown() {
        age += 1
        ageDisplay.text = "age: \(age) days"
        idealWeight += 5
        if idealWeight - tamagotchi.weight > 10 || idealWeight - tamagotchi.weight < -10 {
            if i < healthChart.count - 1 {
                i += 1
            }
        } else {
            if i > 0 {
                i -= 1
            }
        }
        if j > 0 && j < stateChart.count {
            tamagotchi.state = stateChart[j]
        }
        if j > 2 {
            if tamagotchi.happiness > 0 {
                tamagotchi.happiness -= 1
            }
        } else {
            if tamagotchi.happiness < 10 {
                tamagotchi.happiness += 1
            }
        }
        if i > 2 {
            if tamagotchi.happiness > 0 {
                tamagotchi.happiness -= 1
            }
            
        } else {
            if tamagotchi.happiness < 10 {
                tamagotchi.happiness += 1
            }
        }
        if tamagotchi.hunger > 5 {
            if tamagotchi.happiness > 0 {
                tamagotchi.happiness -= 1
            }
        }
        tamagotchi.hunger += 1
        tamagotchi.health = healthChart[i]
        score += 100 * (tamagotchi.happiness * tamagotchi.happiness)
        if i < stateChart.count - 1 {
            i += 1
        }
        updateStats()
    }

}


