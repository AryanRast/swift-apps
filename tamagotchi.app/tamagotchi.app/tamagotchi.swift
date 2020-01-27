//
//  tamagotchi.swift
//  tamagotchi.app
//
//  Created by Rastogi, Aryan (WING) on 14/01/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import Foundation

struct Tamagotchi {
    var weight: Int
    var happiness: Int
    var state: String
    var height: Double
    var name: String
    var hunger: Double
    var health: String
    
    func displayStats() -> String {
        return """
        state: \(state)
        Weight: \(weight)kg
        happiness: \(happiness)/10
        hunger: \(hunger)
        height: \(height) ft
        health: \(health)
        """
    }
}
