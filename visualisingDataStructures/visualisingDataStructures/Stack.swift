//
//  Stack.swift
//  visualisingDataStructures
//
//  Created by Rastogi, Aryan (WING) on 27/01/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import Foundation

struct Stack {
    
    var stack = [String](repeating: "_", count: 10)
    var top = -1
    
    mutating func pop(){
        if top != -1 {
            self.top -= 1
        }
    }
    
    mutating func push(item: String) {
        if top <= stack.count - 1 {
            self.top += 1
            stack[top] = item
            
        }
        
    }
    
    func peak()
    
    
    
    
    
    
    
    
}
