//
//  ViewController.swift
//  CommentCardWriter
//
//  Created by Rastogi, Aryan (WING) on 11/02/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mySubject: Subject?
    var myCommentCard = CommentCard(subjects: nil, student: nil)




    @IBOutlet var commentdisplay: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func NameButton(_ sender: Any) {
        myCommentCard.student = "Aryan"
        commentdisplay.text = "my name is \(String(describing: myCommentCard.student)), \(String(describing: mySubject?.comment?.writtenComment()))"
    }
    
    @IBAction func SubjectNumberButton(_ sender: Any) {
        mySubject = Subject(name: "CompSci", teacher: "DPC", comment: nil)
    }
    
    @IBAction func YESButton(_ sender: Any) {
        let myComment = Comment(sentiment: nil, maxLength: 500)
        mySubject?.comment = myComment
        
        
        
    }
    
    
    
}

