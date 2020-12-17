//
//  receipt.swift
//  receiptBetaPro
//
//  Created by Rastogi, Aryan (WING) on 30/03/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import Foundation
import SwiftUI

class Receipt {
    
    var store: String?
    var expiry: Date?
    var password: Bool
    var expired: Bool
    var image: UIImage?
    var digiFile: String?
    
    init(store: String?, expiry: Date?, image: UIImage?, digiFile: String?, expired: Bool, password: Bool) {
        self.store = store
        self.expiry = expiry
        self.image = image
        self.digiFile = digiFile
        self.expired = expired
        self.password = password
    }
}
