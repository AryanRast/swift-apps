//
//  Comment.swift
//  CommentCardWriter
//
//  Created by Rastogi, Aryan (WING) on 11/02/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import Foundation

class Comment {
    
    let sentiment: Sentiment?
    let maxLength: Int
    
    init(sentiment: Sentiment?, maxLength: Int) {
        self.sentiment = sentiment
        self.maxLength = maxLength
    }
    
    func writtenComment() -> String {
        return "The subject(s) is easy. I need no help and I understand everything there is to know. I am omniscient"
    }
    
    
}
