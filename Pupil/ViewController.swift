//
//  ViewController.swift
//  Pupil
//
//  Created by Jordan Alnaser on 3/26/17.
//  Copyright © 2017 Jordan Alnaser. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
//    Story Board Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mainTableView: UITableView!
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        // Temporary Test course and assignment
        addCourse("Math")
        addAssignment("Derivatives", "Math", "4/18/2017", nil)
        addCourse("English")
        addAssignment("Paper", "English", "5/2/2017", true)
        
        
        // Register the table view cell class and its reuse id
        self.mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller itself will provide the delegate methods for when cells are tapped and row data for the table view cells.
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func plusButton(_ sender: UIButton) {
        // Stuff here happens after the user presses the plus button
        print("You tapped cell number (plus).")
    }
    
    
// Table Stuff
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // this counts the numvber of assignments in the assignments array to determine number of rows in table plus last cell for the classes table view
        return assignments.count
    }

    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.mainTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // get tjhe name of the cell from the assignments array
        let value = Array(assignments.values)[indexPath.row]
        
        // set the text from the data model
        cell.textLabel?.text = value.getName()
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = mainTableView.cellForRow(at: indexPath)!
        print("You tapped cell (\(String(describing: cell.textLabel!.text!))).")
    }
    
    
  
}

