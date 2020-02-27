//
//  ViewController.swift
//  CommentCardWriter
//
//  Created by Rastogi, Aryan (WING) on 11/02/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
   
    
    
    var myCommentCard = CommentCard(subjects: [], student: nil)


    @IBOutlet var myPicker: UIPickerView!
    

    @IBOutlet var commentdisplay: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPicker.dataSource = self
        myPicker.delegate = self
    }
    
    @IBAction func NameButton(_ sender: Any) {
        myCommentCard.student = "Aryan"
        commentdisplay.text = "my name is \(String(describing: myCommentCard.student!)), \(String(describing: myCommentCard.subjects![0].comment!.writtenComment()))"
    }
    
    @IBAction func SubjectNumberButton(_ sender: Any) {
        for _ in 0...myPicker.selectedRow(inComponent: 0 ) {
            myCommentCard.subjects?.append(Subject(name: nil, teacher: nil, comment: nil))
        }
    }
    
    @IBAction func YESButton(_ sender: Any) {
        let myComment = Comment(sentiment: nil, maxLength: 500)
        for Subject in (myCommentCard.subjects)! {
            Subject.comment = myComment
        
        }
        
        
        
        
    }
    
    let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
       
   func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
   }
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numbers[row]
    }
    
   
    
    
    
}

