//
//  ViewController.swift
//  CarCustomizer
//
//  Created by Rastogi, Aryan (WING) on 12/01/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var carStatistics: UILabel!
    
    
    @IBOutlet var enginePackage: UISwitch!
    @IBOutlet var tiresPackage: UISwitch!
    @IBOutlet var nitroPackage: UISwitch!
    @IBOutlet var ultraPackage: UISwitch!
    @IBOutlet var remainingTimeDisplay: UILabel!
    
    var timeRemaining = 30
    var remainingFunds = 1000 {
        didSet {
            remainingFundsDisplay.text = "Remaining Funds: $\(remainingFunds)"
            switchChange()
        }
    }
    
    
    
    var starterCars = StarterCars()
    var index = 0
    var car: Car? {
        didSet {
            carStatistics.text = car?.displayStats()
        }
    }
    
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        car = starterCars.cars[index]
        remainingFundsDisplay.text = "Remaining Funds: $\(remainingFunds)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        remainingTimeDisplay.text = "\(timeRemaining)s"
    }
    
    @IBAction func nextCar(_ sender: Any) {
        index += 1
        if index >= starterCars.cars.count {
            index = 0
        }
        car = starterCars.cars[index]
        reset()
      }
    
    
    @IBAction func engineToggle(_ sender: Any) {
        if enginePackage.isOn {
            car?.topSpeed += 50
            remainingFunds -= 500
        } else{
            car?.topSpeed -= 50
            remainingFunds += 500
        }
    }
    
    @IBOutlet var remainingFundsDisplay: UILabel!
    
    @IBAction func tiresToggle(_ sender: Any) {
        if tiresPackage.isOn {
            car?.handling += 1
            remainingFunds -= 500
        } else {
            car?.handling -= 1
            remainingFunds += 500
        }
    }
    
    @IBAction func nitroToggle(_ sender: Any) {
        if nitroPackage.isOn {
            car?.acceleration -= 0.5
            remainingFunds -= 500
        } else {
            car?.acceleration += 0.5
            remainingFunds += 500
        }
    }
    
    @IBAction func ultraToggle(_ sender: Any) {
        if ultraPackage.isOn {
            car?.acceleration -= 0.5
            car?.topSpeed += 30
            car?.handling += 1
            remainingFunds -= 1000
        } else {
            car?.acceleration += 0.5
            car?.topSpeed -= 30
            car?.handling -= 1
            remainingFunds += 1000
        }
    }
    
    func reset() {
        remainingFunds = 1000
        enginePackage.setOn(false, animated: true)
        tiresPackage.setOn(false, animated: true)
        nitroPackage.setOn(false, animated: true)
        ultraPackage.setOn(false, animated: true)
    }
    
    func switchChange() {
        enginePackage.isEnabled = enableOrNot(enginePackage)
        tiresPackage.isEnabled = enableOrNot(tiresPackage)
        nitroPackage.isEnabled = enableOrNot(nitroPackage)
        ultraPackage.isEnabled = enableOrNot(ultraPackage)
    }
    
    func enableOrNot(_ control: UISwitch) -> Bool {
        if control.isOn {
            return true
        } else {
            if remainingFunds >= 1000 {
                return true
            } else if remainingFunds >= 500 {
                let name = control.accessibilityIdentifier
                if name == "ultraSwitch" {
                    return false
                } else {
                    return true
                }
            } else {
                return false
            }
        }
    }
    
    @objc func countdown() {
        if timeRemaining > 0 {
            timeRemaining -= 1
            remainingTimeDisplay.text = "\(timeRemaining)s"
        } else {
            timer?.invalidate()
            reset()
            enginePackage.isEnabled = false
            tiresPackage.isEnabled = false
            nitroPackage.isEnabled = false
            ultraPackage.isEnabled = false
            
        }
    }

}

