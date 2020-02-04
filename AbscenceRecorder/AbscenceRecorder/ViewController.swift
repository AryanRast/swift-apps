//
//  ViewController.swift
//  AbscenceRecorder
//
//  Created by Rastogi, Aryan (WING) on 29/01/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var divisions: [Division] = []
    var currentDate: Date = Date()
    
    @IBAction func previousDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    @IBAction func nextDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: +1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    
    
    

    func updateDateDisplay() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        navigationItem.title = formatter.string(from: currentDate)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDummyData()
        for division in divisions {
            print("code: \(division.code), No.: \(division.students.count)")
            for student in division.students {
                print(" \(student.forename)")
            }
        }
        updateDateDisplay()
    }
    
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        
        cell.textLabel?.text = divisions[indexPath.row].code
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DivisionAbscenceViewController") as? DivisionAbscenceViewController else {
            fatalError("Failed to load")
        }
        vc.divison = divisions[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    func addDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "cW-1", size: 8))
        divisions.append(DivisionFactory.createDivision(code: "fS-900", size: 3))
        divisions.append(DivisionFactory.createDivision(code: "bS-1917", size: 7))
    }
    


}

