//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by Rastogi, Aryan (WING) on 21/11/2019.
//  Copyright © 2019 Rastogi, Aryan (WING). All rights reserved.
//

import Foundation

class Tamagotchi {
    
    private var age: Int
    private var weight: Int
    private var happiness: String
    private var gender: Bool
    private var height: Double
    private var name: String
    private var hunger: Int
    private var ill: Bool
    
    
    init() {
        age = 0
        weight = 1
        happiness = "sad"
        gender = true
        height = 0.0
        name = "Maurice"
        hunger = 0
        ill = false
    }
    
    func getAge() -> Int {
        return self.age
    }
    
    func getWeight() -> Int {
        return self.weight
    }
    
    func getEverything() -> (Int, Int, String, Bool, Double, String, Int, Bool) {
        return (self.age, self.weight, self.happiness, self.gender, self.height, self.name, self.hunger, self.ill)
        
    }

    

    


}




