//
//  ViewController.swift
//  tamagotchi.app
//
//  Created by Rastogi, Aryan (WING) on 14/01/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var leaderboard = [Int]()
    var healthChart = ["God level", "Perfect", "Fit", "Healthy", "Ok", "Unwell", "Not good", "ill", "Severely ill", "Near Death", "Death"]
    var stateChart = ["Fresh", "Clean", "Ok", "Bearable", "Smelly", "Unbearable", "slob", "Mouldy"]
    var age = 0
    var i = 3
    var j = 3
    var score = 0
    

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var tamagotchiStats: UILabel!
    @IBOutlet var ageDisplay: UILabel!
    @IBOutlet var idealWeightDisplay: UILabel!
    @IBOutlet var nameDisplay: UILabel!
    @IBOutlet var pointsDisplay: UILabel!
    @IBOutlet var progress: UIProgressView!
    
    var tamagotchi = Tamagotchi(weight: 30, happiness: 6, state: "bearable", height: 2, name: "Maurice", hunger: 5, health: "Ok")
    
    var timer: Timer?
    var idealWeight = 40

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        imageView.image = UIImage(named: "startmaurice")
        tamagotchiStats.text = tamagotchi.displayStats()
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        ageDisplay.text = "age: \(age) days"
        idealWeightDisplay.text = "Ideal weight: \(idealWeight)kg"
        nameDisplay.text = "\(tamagotchi.name)"
        pointsDisplay.text = "\(score)"
    }
    
    func reset() {
        progress.progress = 0
        age = 0
        i = 3
        j = 3
        score = 0
        imageView.image = UIImage(named: "startmaurice")
        idealWeight = 40
        idealWeightDisplay.text = "Ideal weight: \(idealWeight)kg"
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        tamagotchi.weight = 30
        tamagotchi.happiness = 6
        tamagotchi.height = 2
        tamagotchi.hunger = 5
        ageDisplay.text = "age: \(age) days"
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        updateStats()
        
    }
    
    
    func death(title: String, message: String) {
        leaderboard.append(score)
        imageView.image = UIImage(named:"deathmaurice")
        
        timer?.invalidate()
        var messageNew = message
        if score > leaderboard[0] {
            messageNew += "\n New highscore!"
        }
        
        let alert = UIAlertController(title: title, message: messageNew, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "reset", style: UIAlertAction.Style.default, handler: { (action) in
            self.reset()
        }))
        self.present(alert, animated: true)
        

                
    }
    
    func updateStats() {
        if tamagotchi.happiness > 8 {
            imageView.image = UIImage(named: "happymaurice")
        } else if tamagotchi.happiness > 5 {
            imageView.image = UIImage(named: "startmaurice")
        } else if tamagotchi.happiness > 3 {
            imageView.image = UIImage(named: "okmaurice")
        } else {
            imageView.image = UIImage(named: "sadmaurice")
        }
        if age == 20{
            death(title: "Maurice Has Passed", message: "Congratulations, Maurice has died of natural causes. He is in a better place now. You scored \(score) points")
        }
        if j == stateChart.count - 1 {
            death(title: "DEATH BY SMELL", message: "Maurice was so dirty that he was engulfed in mould and subsequently suffocated. You scored \(score) points")
        }
        if i == healthChart.count - 1 {
            death(title: "DEATH BY ILLNESS", message: "Unfortunately Maurice has passed away due to poor health. It is illegal to neglect your pet like this. the feds are on their way. You scored \(score) points")
        }
        if tamagotchi.happiness == 0 {
            death(title: "DEATH BY SADNESS", message: "Maurice has died of a broken heart. You scored \(score) points")
        }
        if tamagotchi.hunger > 10 {
            death(title: "DEATH BY STARVATION", message: "Regardless of his weight, Maurice decided it was better to be dead than to exist in a world where his hunger level where so high. You scored \(score) points")
        }
        if tamagotchi.weight < 0 {
            tamagotchi.weight = 0 //bug for weight fixed here please change later 
        }
       
        tamagotchi.state = stateChart[j]
        tamagotchi.health = healthChart[i]
        
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
        
        if tamagotchi.hunger >= 1 {
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
        tamagotchi.weight += 15
        tamagotchi.height += 1
        if tamagotchi.hunger >= 2 {
            tamagotchi.hunger -= 2
        }
        
        updateStats()
    }
    
    @IBAction func cleanButton(_ sender: Any) {
        if j > 0 {
            j -= 1
        }
        updateStats()
    }
    
    @IBAction func exerciseButton(_ sender: Any) {
        if tamagotchi.weight >= 5 {
            tamagotchi.weight -= 5
            if tamagotchi.hunger < 10 {
                tamagotchi.hunger += 0.5
            }
        }
        updateStats()
    }
    
    func leaderboardTopTen() {
        let endPoint = leaderboard.count
        var leaderboardString = """
        """

        var temp = 0

        for j in 0 ..< leaderboard.count {
            for i in 0 ..< endPoint - 1 - j  {
                if leaderboard[i] < leaderboard[i+1] {
                    temp = leaderboard[i]
                    leaderboard[i] = leaderboard[i+1]
                    leaderboard[i+1] = temp
                }
            }
        }
        
        for q in 0..<leaderboard.count {
            
            if q < 5 {
                leaderboardString.append("\n")
                leaderboardString.append("\(q+1). \(leaderboard[q])")
            }
        }
        displayLeaderBoard(title: "TOP SCORES", message: leaderboardString)

    }
    
    @IBAction func leaderboardButton(_ sender: Any) {
        leaderboardTopTen()
        
    }
    
    func displayLeaderBoard(title: String, message: String) {
        
        timer?.invalidate()
        
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: { (action) in
            self.reset()
        }))
        self.present(alert, animated: true)
        
    }
    
    @objc func countdown() {
        progress.progress += 0.05
        
        age += 1
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "\(age)background")!)
        ageDisplay.text = "age: \(age) months"
        idealWeight += 5
        if age > 12 {
            if tamagotchi.happiness > 0 {
                tamagotchi.happiness -= 1
            }
            if i < stateChart.count - 1{
                i += 2
            }
        }
        if idealWeight - tamagotchi.weight > 10 || idealWeight - tamagotchi.weight < -10 {
            if i < healthChart.count {
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
        if i > 4 {
            if tamagotchi.happiness > 2 {
                tamagotchi.happiness -= 2
            }
            
        } else if i > 2 {
            if tamagotchi.happiness > 1 {
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
        if i < stateChart.count {
            i += 1
        }
        idealWeightDisplay.text = "Ideal weight: \(idealWeight)kg"
        updateStats()
    }

}


