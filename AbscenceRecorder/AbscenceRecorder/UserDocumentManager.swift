//
//  UserDocumentManager.swift
//  AbscenceRecorder
//
//  Created by Rastogi, Aryan (WING) on 09/03/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import Foundation


class UserDocumentManager {
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
