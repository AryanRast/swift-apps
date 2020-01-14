//
//  tamagotchi.swift
//  tamagotchi.app
//
//  Created by Rastogi, Aryan (WING) on 14/01/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import Foundation

struct Tamagotchi {
    var age: Int
    var weight: Int
    var happiness: Int
    var gender: String
    var height: Double
    var name: String
    var hunger: Int
    var health: String
    
    func displayStats() -> String {
        return """
        name: \(name)
        Age: \(age)
        gender: \(gender)
        Weight: \(weight)
        happiness: \(happiness)
        hunger: \(hunger)
        height: \(hunger)
        health: \(health)
        """
    }
}
