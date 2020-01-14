//
//  tamagotchi.swift
//  tamagotchiIOS
//
//  Created by Rastogi, Aryan (WING) on 14/01/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import Foundation

struct Tamagotchi {
    var age: Int
    var weight: Int
    var happiness: String
    var gender: Bool
    var height: Double
    var name: String
    var hunger: Int
    var ill: Bool
    
    func displayStats() -> String {
        return """
        Age: \(age)
        Weight: \(weight)
        : \(topSpeed) mph
        Acceleration (0-60): \(acceleration)s
        Handling: \(handling)
        """
    }
}


