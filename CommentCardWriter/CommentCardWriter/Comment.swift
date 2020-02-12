//
//  Comment.swift
//  CommentCardWriter
//
//  Created by Rastogi, Aryan (WING) on 11/02/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import Foundation

struct Comment {
    
    var sentiment: Sentiment?
    var maxLength: Int
    
    func writtenComment() -> String {
        return "It is easy"
    }
    
    
}
