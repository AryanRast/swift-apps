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
    
    
    init(name: String, gender: Bool) {
        age = 0
        weight = 0
        happiness = "sad"
        self.name = name
        self.gender = gender
        height = 0.0
        hunger = 0
        ill = false
    }
    
    func getAge() -> Int {
        return self.age
    }
    
    func getWeight() -> Int {
        return self.weight
    }
    func getHappiness() -> String {
        return self.happiness
    }
    
    func getGender() -> Bool {
        return self.gender
        
    }
    
    func getHeight() -> Double {
        return self.height
    }
    
    func getName() -> String {
        return self.name
        
    }
    func getHunger() -> Int {
        return self.hunger
    }
    
    func getIll() -> Bool {
        return self.ill
    }
    
        

    

    


}




