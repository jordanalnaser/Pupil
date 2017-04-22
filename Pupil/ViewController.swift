//
//  ViewController.swift
//  Pupil
//
//  Created by Jordan Alnaser on 3/26/17.
//  Copyright © 2017 Jordan Alnaser. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, AddButtonDelegate{
    
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
        
    
        // Temp Add Classes
        addCourse("Math")
        addCourse("English")
        addCourse("Programming")
        
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
    
            }
        })
        
    }
    
    
     // This function is used to create an addCourseView to input data for a new assignment
    func addCourseView(){
        let frame = self.view.frame
        
        // making the temporary assignment view that will be used to input data
        let addCourseView = AddCourseView(frame: CGRect(x: frame.minX + 5, y: frame.minY + 20, width: frame.width - 10, height: frame.height - 25))
        
        // used for the animation to work
        addCourseView.contentScaleFactor = 0.1
        
        
        self.view.addSubview(addCourseView)
        
        
        
        // This scales the view back to 1 for a nice Animation
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 10, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            addCourseView.contentScaleFactor = 1
        },completion:  nil)

    }
    
      // This function is used to create an addAssignmentView to input data for a new assignment
    func addAssignmentView(){
        let frame = self.view.frame
        
        // making the temporary assignment view that will be used to input data
        let addAssignmentView = AddAssignmentView(frame: CGRect(x: frame.minX + 5, y: frame.minY + 20, width: frame.width - 10, height: frame.height - 25))
        
        // used for the animation to work
        addAssignmentView.contentScaleFactor = 0.1
        
        // Setting the delegate of this instance to be this view controller
        addAssignmentView.delegate = self
        
        self.view.addSubview(addAssignmentView)
        
        
        
        // This scales the view back to 1 for a nice Animation
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 10, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            addAssignmentView.contentScaleFactor = 1
        },completion:  nil)

    }

    // This function is triggered via the delegate class(this class)when user taps the add button in AddAssignmentView
    func finishedAddingAssigment(){
        self.mainTableView.reloadData()
        
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

