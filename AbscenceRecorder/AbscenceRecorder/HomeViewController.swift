//
//  ViewController.swift
//  AbscenceRecorder
//
//  Created by Rastogi, Aryan (WING) on 29/01/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        var abscence = Abscence(date: currentDate)
       
        let selectedDivision = divisions[indexPath.row]
        
        if let existingAbscence = selectedDivision.getAbscence(for: currentDate) {
           abscence = existingAbscence
        } else {
            selectedDivision.abscences.append(abscence)
        }
        
        guard let vc = storyboard?.instantiateViewController(identifier: "DivisionAbscenceViewController", creator: { coder in
                   return DivisionAbscenceViewController(coder: coder, division: selectedDivision, abscence: abscence)
               }) else {
                   fatalError("Failed to load")
               }

        
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    func addDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "cW-1", size: 8))
        divisions.append(DivisionFactory.createDivision(code: "fS-900", size: 3))
        divisions.append(DivisionFactory.createDivision(code: "bS-1917", size: 7))
    }
    


}

