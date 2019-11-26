//
//  main.swift
//  Tamagotchi
//
//  Created by Rastogi, Aryan (WING) on 21/11/2019.
//  Copyright © 2019 Rastogi, Aryan (WING). All rights reserved.
//

import Foundation

func main()  {
    print("What would you like to name your Tamagotchi")
    var chosenGender = false
    if let userInput = readLine() {
        let name = userInput
        print("What gender would you like? Press M for male and F for female")
        if let genderInput = readLine() {
            if genderInput == "M" {
                var chosenGender = true
            } else {
                var chosenGender = false
            }
             
        }
    }
    
    let tamagotchi = Tamagotchi(name: userInput, gender: chosenGender)
}

main()

