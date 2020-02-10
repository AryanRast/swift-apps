//
//  Division.swift
//  AbscenceRecorder
//
//  Created by Rastogi, Aryan (WING) on 29/01/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import Foundation


class Division {
    
    let code: String
    var students: [Student] = []
    var abscences: [Abscence] = []
    
    init(code: String) {
        self.code = code
    }
    
    func getAbscence(for date: Date) -> Abscence? {
        
        
        return abscences.first(where: {
            $0.takenOn == date
        })
    }
    

    
    
}
