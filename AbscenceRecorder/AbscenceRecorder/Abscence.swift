//
//  Abscence.swift
//  AbscenceRecorder
//
//  Created by Rastogi, Aryan (WING) on 06/02/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import Foundation

class Abscence {
    var takenOn: Date
    var present: [Student] = []
    var selectedRows: [IndexPath]?
    
    init(date: Date) {
        takenOn = date
    }
}
