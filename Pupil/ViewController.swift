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
    let addHomeWorkButton = UIButton()
    let addCourseButton = UIButton()
    let addTimerButton = UIButton()
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        // this is used to give the plus button ability to be tapped
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(plusButtonPressed(tapGestureRecognizer:)))
        plusButton.isUserInteractionEnabled = true
        plusButton.addGestureRecognizer(tapGestureRecognizer)
        
        // options buttons positions
        addCourseButton.frame = CGRect(x: plusButton.frame.minX - 60, y: plusButton.frame.minY - 50, width: 50, height: 50)
        addHomeWorkButton.frame = CGRect(x: plusButton.frame.minX + 30, y: plusButton.frame.minY - 75, width: 50, height: 50)
        addTimerButton.frame = CGRect(x: plusButton.frame.minX - 100, y: plusButton.frame.minY + 20, width: 50, height: 50)
        
        // perform setup on option buttons
        setUpOptionButton(addCourseButton, imageFile: UIImage(named: "addCourse.png")!)
        self.addHomeWorkButton.addTarget(self, action: #selector(addAssignmentView(_:)), for: .touchUpInside)
        self.view.addSubview(addCourseButton)
        
        setUpOptionButton(addHomeWorkButton, imageFile: UIImage(named: "addHomework.png")!)
        self.addCourseButton.addTarget(self, action: #selector(addCourseView(_:)), for: .touchUpInside)
        self.view.addSubview(addHomeWorkButton)
        
        setUpOptionButton(addTimerButton, imageFile: UIImage(named: "addTimer.png")!)
        self.addTimerButton.addTarget(self, action: #selector(addTimerView(_:)), for: .touchUpInside)
        self.view.addSubview(addTimerButton)
        
        
        // Temp classes added, until we figure out a way to use Core Data to sore them on the device permenatly
        addCourse("Math")
        addCourse("English")
        addCourse("Programming")
        
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
        let radians = atan2(Double(tappedImage.transform.b), Double(tappedImage.transform.a))
        
        // Add the two subviews to add assignment, and add class
        UIView.animate(withDuration: 0.4, animations: {
            if radians > 0.785390 {
                // plus button is open, close it
                tappedImage.transform = CGAffineTransform.init(rotationAngle: 0)
                self.dissmissPlusButtonOptions(self.addHomeWorkButton, self.addCourseButton, self.addTimerButton)
            }else{
                // plus button is closed, open it
                tappedImage.transform = CGAffineTransform.init(rotationAngle: 0.785398)
                self.plusButtonOptions(motherView: tappedImage, self.addHomeWorkButton, self.addCourseButton, self.addTimerButton)
                
                
            }
        })
        
    }
    
    // function is used to get rid of the plus button options when the user is done with them
    func dissmissPlusButtonOptions(_ addHomeWorkButton:UIButton, _ addCourseButton:UIButton, _ addTimerButton:UIButton){
        UIView.animate(withDuration: 1, animations: {
            addHomeWorkButton.alpha = 0
            addCourseButton.alpha = 0
            addTimerButton.alpha = 0
        }, completion:{
            _ in
            addHomeWorkButton.isUserInteractionEnabled = false
            addCourseButton.isUserInteractionEnabled = false
            addTimerButton.isUserInteractionEnabled = false
        })
    }
    
    // functions displaying the two options when the user taps the plus button
    func plusButtonOptions(motherView: UIImageView, _ addHomeWorkButton:UIButton, _ addCourseButton:UIButton, _ addTimerButton:UIButton){
        // Options added Animation
        UIView.animate(withDuration: 1, animations: {
            addCourseButton.alpha = 1
            addHomeWorkButton.alpha = 1
            addTimerButton.alpha = 1
        }, completion: {
            _ in
            addHomeWorkButton.isUserInteractionEnabled = true
            addCourseButton.isUserInteractionEnabled = true
            addTimerButton.isUserInteractionEnabled = true
        })
    }
    
    // Setup Plus Button Options Functions
    func setUpOptionButton(_ optionButton:UIButton, imageFile:UIImage){
        optionButton.alpha = 0
        optionButton.isUserInteractionEnabled = false
        
        // setting the image of the button
        optionButton.setImage(imageFile, for: .normal)
        
        // The press animations of these butons
        optionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchDown)
        optionButton.addTarget(self, action: #selector(buttonRelased(_:)), for: .touchDragExit)
    }
    
    // This function is used to create an addCourseView to input data for a new assignment
    func addCourseView(_ button:UIButton){
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
    func addAssignmentView(_ button:UIButton){
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
    
    func addTimerView(_ button:UIButton){
        let frame = self.view.frame
        
        // making the temporary assignment view that will be used to input data
        let addTimerView = TimerView(frame: CGRect(x: frame.minX + 5, y: frame.minY + 20, width: frame.width - 10, height: frame.height - 25))
        
        
        
        // used for the animation to work
        addTimerView.contentScaleFactor = 0.1
        
        // Setting the delegate of this instance to be this view controller
        addTimerView.delegate = self
        
        self.view.addSubview(addTimerView)
        
        
        
        // This scales the view back to 1 for a nice Animation
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 10, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            addTimerView.contentScaleFactor = 1
        },completion:  nil)
        
    }
    
    // This function is triggered via the delegate class(this class)when user taps the add button in AddAssignmentView
    func finishedAddingAssigment(){
        self.mainTableView.reloadData()
        
    }
    
    // this creates the press down and up aniumation of a button
    func buttonPressed(_ button:UIButton){
        button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9);
    }
    func buttonRelased(_ button:UIButton){
        button.transform = CGAffineTransform(scaleX: 1.0, y: 1.0);
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier,for: indexPath) as! CustomTableCell
        
        // get tjhe name of the cell from the assignments array
        let assignment = Array(assignments.values)[indexPath.row]
        
        // setting up[ the date object to due date formate, just the day and month
        let date = assignment.getDueDate()
        let calendar = NSCalendar.current
        
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let monthName = calendar.monthSymbols[month - 1]
        
        let dueDateFormat = "Due on: \n" + monthName + " - " + String(day)
        
        // set the text from the data model
        cell.assignmentName?.text = assignment.getName()
        cell.courseName?.text = assignment.getCourseName()
        cell.dueDate?.text = dueDateFormat
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //let currentCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier,for: indexPath) as! CustomTableCell
        let currentCell = tableView.cellForRow(at: indexPath) as! CustomTableCell
        if editingStyle == .delete {
            let assignmentKey = currentCell.assignmentName.text! + currentCell.courseName.text!
            
            deleteAssignment(assignmentKey)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        else {
            print("Unhandled editing style! \(editingStyle)")
        }
    }
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = mainTableView.cellForRow(at: indexPath)! as! CustomTableCell
        print("You tapped cell (\(String(describing: cell.assignmentName.text))).")
    }
}

