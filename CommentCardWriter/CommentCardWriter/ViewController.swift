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
    var comment: Comment?

    @IBOutlet var commentdisplay: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func SubjectNumberButton(_ sender: Any) {
        mySubject? = Subject(name: "CompSci", teacher: "DPC", comment: nil)
    }
    
    @IBAction func YESButton(_ sender: Any) {
        comment = Comment(sentiment: nil, maxLength: 500)
        mySubject?.comment = comment
        commentdisplay.text = mySubject?.comment?.writtenComment()
    }
    
    
    
}

