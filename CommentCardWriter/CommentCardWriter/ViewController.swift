//
//  ViewController.swift
//  CommentCardWriter
//
//  Created by Rastogi, Aryan (WING) on 11/02/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import UIKit



class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var subjectList0: UILabel!
    @IBOutlet var subjectList1: UILabel!
    @IBOutlet var subjectList2: UILabel!
    @IBOutlet var subjectList3: UILabel!
    @IBOutlet var subjectList4: UILabel!
    @IBOutlet var subjectList5: UILabel!
    @IBOutlet var subjectList6: UILabel!
    @IBOutlet var subjectList7: UILabel!
    @IBOutlet var subjectList8: UILabel!
    @IBOutlet var subjectList9: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var subjectConfirmButton: UIButton!
    @IBOutlet var nameEnterButton: UIButton!
    @IBOutlet var plusSubjectButton: UIButton!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var myPicker: UIPickerView!
    @IBOutlet var generateButton: UIButton!
    
    
    @IBAction func generateButton(_ sender: Any) {
        name.text = myCommentCard.subjects?[subjectNumber - 1].comment
    }
    
    var myCommentCard = CommentCard(subjects: [], student: nil)
    var firstName = ""
    var subjectNumber = 0
    var subjectName = ""
    var subjectListText = ""
    var subjectListArray = [UILabel]()
    var wellOpinionArray = ["I think I'm doing very poorly in ", "I don't think I'm doing well in ", "I'm not too happy about ", "My performance could be slightly better in ", "I'm doing alright in ", "I think I'm doing fairly well in ", "I think this half has been good for ", "I'm really pleased with my performance in ", "I think everything is going great in ", "I don't think things could be better with "]
    var effortOpinionArray = [". To be honest, I haven't been trying much at all in the subject ", ". Unfortunately I don't believe I've been trying in divisions and EW", ". Unfortunately I don't believe Ive been at my best during divisions", ". I am putting in minimal effort in my work and EW", ". I'm putting a decent amount of effort in everything I do",". I've been putting in an effort to improve", ". I've been working relatively hard both in and out of division", ". I've been working hard to improve my performance across the board", ". I've been trying my hardest to improve by briefly consolidating notes at house and paying full attention in class", ". I've been doing everything possible to maximise my performance; revising in house, trying my best in EWs and paying full attention in class"]
    var enjoymentOpinionArray = ["finding the content boring and I struggle to engage.", "not really enjoying lessons at all.", "finding lessons not very interesting I'm afraid.", "finding lessons fairly interesting although sometimes it gets a bit tedious.", "finding lessons fairly interesting.", "quite enjoying the topic we cover.", "really liking the lessons and topics we are studying.", "really enjoying the lessons and content we are covering.", " taking a real interest in the content and finding lessons fun and engaging.", " really enjoying studying the subject and I find the lessons fun and engaging."]
    
    


 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(wellOpinionArray.count)
        print(effortOpinionArray.count)
        subjectListArray.append(subjectList0)
        subjectListArray.append(subjectList1)
        subjectListArray.append(subjectList2)
        subjectListArray.append(subjectList3)
        subjectListArray.append(subjectList4)
        subjectListArray.append(subjectList5)
        subjectListArray.append(subjectList6)
        subjectListArray.append(subjectList7)
        subjectListArray.append(subjectList8)
        subjectListArray.append(subjectList9)
        plusSubjectButton.isEnabled = false
        nameField.delegate = self
        myPicker.dataSource = self
        myPicker.delegate = self
        plusSubjectButton.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)
        plusSubjectButton.layer.cornerRadius = 13.0
        plusSubjectButton.tintColor = UIColor.white
        subjectConfirmButton.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.4765625, blue: 0.996, alpha: 0.75)
        subjectConfirmButton.layer.cornerRadius = 11.0
        subjectConfirmButton.tintColor = UIColor.white
        nameEnterButton.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.4765625, blue: 0.996, alpha: 0.75)
        nameEnterButton.layer.cornerRadius = 11.0
        nameEnterButton.tintColor = UIColor.white
        generateButton.backgroundColor = UIColor.init(displayP3Red: 0.998, green: 0.01, blue: 0.418, alpha: 1.0)
        generateButton.layer.cornerRadius = 15.0
        generateButton.tintColor = UIColor.white
        for value in subjectListArray {
            value.clipsToBounds = true
            value.layer.cornerRadius = 10.0
        }
        
        
        
    
    }
    
    @IBAction func nameEnterButton(_ sender: Any) {
        firstName = nameField.text!
        myCommentCard.student = firstName
        name.text = firstName
    }
    
    
    @IBAction func subjectConfirmButton(_ sender: Any) {
        for _ in 0...myPicker.selectedRow(inComponent: 0 ) + 1 {
            myCommentCard.subjects?.append(Subject(name: nil, teacher: nil, comment: nil))
        }
        for j in 0...subjectListArray.count - 1 {
            if j > myPicker.selectedRow(inComponent: 0) {
                subjectListArray[j].isHidden = true
            }
        }
        myPicker.isUserInteractionEnabled = false
        plusSubjectButton.isEnabled = true
        plusSubjectButton.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)

        
    }
    
    @IBAction func plusSubjectButton(_ sender: Any) {
        

        
        print(subjectNumber)
        
        if subjectNumber <= myPicker.selectedRow(inComponent: 0) {
            
            
            print(subjectNumber)
            guard let vc = storyboard?.instantiateViewController(identifier: "secondView", creator: { coder in
            return SecondViewController(coder: coder, subjectNumber: self.subjectNumber)
                  }) else {
                      fatalError("Failed to load")
                  }
            
            present(vc, animated: true)
            
            
          
            
            vc.completionHandler1 = { text in
                self.subjectName = text!

                self.myCommentCard.subjects?[self.subjectNumber].name = self.subjectName
                self.subjectListArray[self.subjectNumber].text = self.myCommentCard.subjects?[self.subjectNumber].name
                self.subjectNumber += 1
                }
           
            vc.completionHandler2 = { wellNumber in
                print(self.subjectNumber)
                self.myCommentCard.subjects?[self.subjectNumber - 1].comment = self.wellOpinionArray[wellNumber!] + (self.myCommentCard.subjects?[self.subjectNumber - 1].name)!
                print(self.myCommentCard.subjects?[self.subjectNumber - 1].comment ?? "Error")
            }
            
            vc.completionHandler3 = { effortNumber in
                print("cmpl 3 \(self.subjectNumber)")
                self.myCommentCard.subjects?[self.subjectNumber - 1].comment! += self.effortOpinionArray[effortNumber!]
            }
            vc.completionHandler4 = { enjoymentNumber in
                print("cmpl 4 \(self.subjectNumber)")
                self.myCommentCard.subjects?[self.subjectNumber - 1].comment! += ". Also I feel like I'm " + self.enjoymentOpinionArray[enjoymentNumber!]
            }
            vc.completionHandler5 = { text2 in
                self.myCommentCard.subjects?[self.subjectNumber - 1].comment! += " I think I'm best at " + text2!
            }
            vc.completionHandler6 = { text3 in
                self.myCommentCard.subjects?[self.subjectNumber - 1].comment! += ", however my weaknesses include " + text3! + "."
            }
            
            
            
            
            
               
                       
            
        } else {
            plusSubjectButton.isEnabled = false
            plusSubjectButton.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)
            
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
   
    
    
    
}

