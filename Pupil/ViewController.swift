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
    @IBOutlet weak var plusButton: UIImageView!
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        // Do any additional setup after loading the view
       
        // this is used to give the plus button ability to be tapped
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(plusButtonPressed(tapGestureRecognizer:)))
        plusButton.isUserInteractionEnabled = true
        plusButton.addGestureRecognizer(tapGestureRecognizer)
        
        
        
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

    func plusButtonPressed(tapGestureRecognizer: UITapGestureRecognizer){
        // plus button has been pressed, do stuff now
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let degrees = atan2(Double(tappedImage.transform.b), Double(tappedImage.transform.a)) * (180 / Double.pi);

        // Add the two subviews to add assignment, and add class
        UIView.animate(withDuration: 0.4, animations: {
            if degrees > 50 {
                // plus button is open, close it
                tappedImage.transform = CGAffineTransform.init(rotationAngle: 0)

            }else{
                // plus button is closed, open it
                tappedImage.transform = CGAffineTransform.init(rotationAngle: 45)
                let frame = self.view.frame
                
                // making the temporary assignment view that will be used to input data
                // Assinging its frame to werid setup values to allow for animation to fix it later and create a nice springy animation
                let tempAssView = AddAssignmentView(frame: CGRect(x: frame.midX + 5, y: frame.midY + 20, width: 1, height: 1))
                
                // This will be a Temporary view of an Ass adding screen
                self.view.addSubview(tempAssView)
                
                
                // This adds the Springy Animation
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 10, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
                    tempAssView.frame = CGRect(x: frame.minX + 5, y: frame.minY + 20, width: frame.width - 10, height: frame.height - 25)
                },completion:  nil)
               
            }
        })
        
    }
    
    
    
// Table Stuff
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // this counts the numvber of assignments in the assignments array to determine number of rows in table 
        return assignments.count
    }

    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.mainTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // get tjhe name of the cell from the assignments array
        let assignment = Array(assignments.values)[indexPath.row]
        
        
        // set the text from the data model
        cell.textLabel?.text = assignment.getName()
     
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = mainTableView.cellForRow(at: indexPath)!
        print("You tapped cell (\(String(describing: cell.textLabel!.text!))).")
    }
    
    
  
}

