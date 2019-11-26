//
//  TamagotchiTests.swift
//  TamagotchiTests
//
//  Created by Rastogi, Aryan (WING) on 21/11/2019.
//  Copyright © 2019 Rastogi, Aryan (WING). All rights reserved.
//

import XCTest

class TamagotchiTests: XCTestCase {
    
    func testifTamagotchiReturnsValue() {
        let tamagotchi = Tamagotchi(name: "Aryan", gender: true)
        XCTAssertNotNil(tamagotchi)
        XCTAssertEqual(tamagotchi.getAge(), 0)
        XCTAssertEqual(tamagotchi.getWeight(), 0)
        XCTAssertEqual(tamagotchi.getHappiness(), "sad")
        XCTAssertEqual(tamagotchi.getGender(), true)
        XCTAssertEqual(tamagotchi.getHeight(), 0)
        XCTAssertEqual(tamagotchi.getHunger(), 0)
        XCTAssertEqual(tamagotchi.getIll(), false)
        XCTAssertEqual(tamagotchi.getName(), "Aryan")
      
    }
    

}
