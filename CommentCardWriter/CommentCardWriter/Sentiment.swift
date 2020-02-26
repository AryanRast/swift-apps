//
//  Sentiment.swift
//  CommentCardWriter
//
//  Created by Rastogi, Aryan (WING) on 11/02/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import Foundation


class Sentiment {
    
    let effort: Int
    let enjoyment: Int
    let weaknesses: String
    let strength: String
    
    init(effort: Int, enjoyment: Int, weaknesses: String, strength: String) {
        self.effort = effort
        self.enjoyment = enjoyment
        self.weaknesses = weaknesses
        self.strength = strength
    }
    
}
