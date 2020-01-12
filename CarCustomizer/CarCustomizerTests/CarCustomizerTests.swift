//
//  CarCustomizerTests.swift
//  CarCustomizerTests
//
//  Created by Rastogi, Aryan (WING) on 12/01/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import XCTest
@testable import CarCustomizer

class CarCustomizerTests: XCTestCase {

    func testCarGetsStatsCorrectly() {
        let car = Car(make: "Ferrari", model: "La-Ferrari", topSpeed: 250, acceleration: 1.2, handling: 9)
        let expected = """
        Make: Ferrari
        Model: La-Ferrari
        Top Speed: 250 mph
        Acceleration (0-60): 1.2s
        Handling: 9
        """
        let actual = car.displayStats()
        XCTAssertEqual(actual, expected)
    }
   

}
