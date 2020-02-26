//
//  CommentCard.swift
//  CommentCardWriter
//
//  Created by Rastogi, Aryan (WING) on 11/02/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import Foundation


class CommentCard {
    
    var subjects: [Subject]?
    var student: String?
    
    init(subjects: [Subject]?, student: String?) {
        self.subjects = subjects
        self.student = student
    }
    
}
