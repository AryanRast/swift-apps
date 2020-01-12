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
    
    var car = Car(make: "Ferrari", model: "La-Ferrari", topSpeed: 250, acceleration: 1.2, handling: 9)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        carStatistics.text = car.displayStats()
    }


}

