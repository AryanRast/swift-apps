//
//  DivisionTests.swift
//  AbscenceRecorderTests
//
//  Created by Rastogi, Aryan (WING) on 09/03/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import XCTest

class DivisionTests: XCTestCase {

    func testGetAbscenceWithCurrentDateRetrievesExistingAbscenceOnSameDay() {
        let division = Division(code: "TestDiv")
        let abscence = Abscence(date: Date())
        division.abscences.append(abscence)
        let dateLaterToday = Date(timeIntervalSinceNow: 100)
        let actual = division.getAbscence(for: dateLaterToday)
        
        XCTAssertNotNil(actual)
    }

}
