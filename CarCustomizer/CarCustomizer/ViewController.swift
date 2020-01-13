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
    
  
    var remainingFunds = 2000 {
        didSet {
            ultraPackage.isEnabled = true
            tiresPackage.isEnabled = true
            enginePackage.isEnabled = true
            nitroPackage.isEnabled = true
            remainingFundsDisplay.text = "Remaining Funds: $\(remainingFunds)"
            if remainingFunds < 500 {
                tiresPackage.isEnabled = false
                enginePackage.isEnabled = false
            } else if remainingFunds < 750 {
                nitroPackage.isEnabled = false
            } else if remainingFunds < 2000 {
                ultraPackage.isEnabled = false
            }
        }
    }
    var starterCars = StarterCars()
    var index = 0
    var car: Car? {
        didSet {
            carStatistics.text = car?.displayStats()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        car = starterCars.cars[index]
        remainingFundsDisplay.text = "Remaining Funds: $\(remainingFunds)"
    }
    
    @IBAction func nextCar(_ sender: Any) {
        index += 1
        if index >= starterCars.cars.count {
            index = 0
        }
        car = starterCars.cars[index]
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
            remainingFunds -= 750
        } else {
            car?.acceleration += 0.5
            remainingFunds += 750
        }
    }
    
    @IBAction func ultraToggle(_ sender: Any) {
        if ultraPackage.isOn {
            car?.acceleration -= 0.5
            car?.topSpeed += 30
            car?.handling += 1
            remainingFunds -= 2000
        } else {
            car?.acceleration += 0.5
            car?.topSpeed -= 30
            car?.handling -= 1
            remainingFunds += 2000
        }
    }
    

}

