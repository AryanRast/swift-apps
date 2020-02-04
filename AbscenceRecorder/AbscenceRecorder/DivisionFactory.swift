//
//  DivisionFactory.swift
//  AbscenceRecorder
//
//  Created by Rastogi, Aryan (WING) on 29/01/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import Foundation


class DivisionFactory {
    
    static func createDivision(code: String, size: Int) -> Division {
        let division = Division(code: code)
        
        for i in 1...size {
            let student = Student(forename: "Firstname\(i)", surname: "Surname\(i)", birthday: Date.init())
            division.students.append(student)
        }
        
        return division
    }
    
    
}
