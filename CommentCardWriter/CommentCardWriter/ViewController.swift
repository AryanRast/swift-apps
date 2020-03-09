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
    }
    
    var myCommentCard = CommentCard(subjects: [], student: nil)
    var firstName = ""
    var subjectNumber = 0
    var subjectName = ""
    var subjectListText = ""
    var subjectListArray = [UILabel]()
    
    


 
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                print(self.subjectNumber)
                self.myCommentCard.subjects?[self.subjectNumber].name = self.subjectName
                self.subjectListArray[self.subjectNumber].text = self.subjectName
                self.subjectNumber += 1
                }
            
            vc.completionHandler2 = { wellNumber in
                self.name.text = "\(wellNumber!)"
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

