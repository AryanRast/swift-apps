//
//  TamagotchiTests.swift
//  TamagotchiTests
//
//  Created by Rastogi, Aryan (WING) on 21/11/2019.
//  Copyright © 2019 Rastogi, Aryan (WING). All rights reserved.
//

import XCTest

class TamagotchiTests: XCTestCase {
    
    func TestifTamagotchiReturnsValue() {
        let tamagotchi = Tamagotchi()
        XCTAssertNotNil(tamagotchi)
        XCTAssertEqual(tamagotchi.getAge(), 0)
        XCTAssertEqual(tamagotchi.getWeight(), 0)
        XCTAssertEqual(tamagotchi.getEverything(), (0, 0, "sad", true, 0.0, "Maurice", 0, false))
        
      
    }
    

}
