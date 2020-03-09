//
//  SecondViewController.swift
//  CommentCardWriter
//
//  Created by Rastogi, Aryan (WING) on 05/03/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var wellConfirm: UIButton!
    @IBOutlet var effortConfirm: UIButton!
    @IBOutlet var enjoymentConfirm: UIButton!
    
    @IBOutlet var subjectNameButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var subjectNameField: UITextField!
    @IBOutlet var subjectName: UILabel!
    @IBOutlet var enjoymentPicker: UIPickerView!
    @IBOutlet var effortPicker: UIPickerView!
    @IBOutlet var wellPicker: UIPickerView!
    
    public var textVariable = ""
    public var completionHandler1: ((String?) -> Void)?
    public var completionHandler2: ((Int?) -> Void)?
    public var completionHandler3: ((Int?) -> Void)?
    public var completionHandler4: ((Int?) -> Void)?
    
    @IBAction func saveButton(_ sender: Any) {
        
        textVariable = subjectNameField.text ?? ""
        completionHandler1?(textVariable)
        
        let wellPickerValue = wellPicker.selectedRow(inComponent: 0) + 1
        completionHandler2?(wellPickerValue)
        
        let effortPickerValue = effortPicker.selectedRow(inComponent: 0) + 1
        completionHandler3?(effortPickerValue)
        
        let enjoymentPickerValue = enjoymentPicker.selectedRow(inComponent: 0) + 1
        completionHandler4?(enjoymentPickerValue)
        
        dismiss(animated: true)
    }
    
    
    @IBAction func confirmButton(_ sender: Any) {
        subjectName.text = subjectNameField.text
        
    }
    
    
  
    
    let subjectNumber: Int
    
    init?(coder: NSCoder, subjectNumber: Int) {
       self.subjectNumber = subjectNumber
       super.init(coder: coder)
    }


    required init?(coder: NSCoder) {
       fatalError("you must create this controller with a subject number")
    }
    
    

    @IBOutlet var moodButton: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        subjectNameField.delegate = self
        wellPicker.dataSource = self
        wellPicker.delegate = self
        enjoymentPicker.dataSource = self
        enjoymentPicker.delegate = self
        effortPicker.dataSource = self
        effortPicker.delegate = self
        saveButton.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.8)
        saveButton.layer.cornerRadius = 16.0
        saveButton.tintColor = UIColor.white
        subjectNameButton.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.4765625, blue: 0.996, alpha: 0.75)
        subjectNameButton.layer.cornerRadius = 11.0
        subjectNameButton.tintColor = UIColor.white
        wellConfirm.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.4765625, blue: 0.996, alpha: 0.75)
        wellConfirm.layer.cornerRadius = 11.0
        wellConfirm.tintColor = UIColor.white
        effortConfirm.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.4765625, blue: 0.996, alpha: 0.75)
        effortConfirm.layer.cornerRadius = 11.0
        effortConfirm.tintColor = UIColor.white
        enjoymentConfirm.backgroundColor = UIColor.init(displayP3Red: 0.0, green: 0.4765625, blue: 0.996, alpha: 0.75)
        enjoymentConfirm.layer.cornerRadius = 11.0
        enjoymentConfirm.tintColor = UIColor.white
        
        subjectName.text = "Subject\(subjectNumber + 1) Name? + initials"
        
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
          return true
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
