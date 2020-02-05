//
//  DivisionAbscenceViewController.swift
//  AbscenceRecorder
//
//  Created by Rastogi, Aryan (WING) on 04/02/2020.
//  Copyright © 2020 Rastogi, Aryan (WING). All rights reserved.
//

import UIKit

class DivisionAbscenceViewController: UITableViewController {
    
    var divison: Division?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divison?.students.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Student", for: indexPath)
        cell.textLabel?.text = divison?.students[indexPath.row].surname
        
        return cell
    }

}
