//
//  AddAssignmentView.swift
//  Pupil
//
//  Created by Jordan Alnaser on 4/18/17.
//  Copyright © 2017 Jordan Alnaser. All rights reserved.
//

import UIKit
import Foundation

// Creating a delegator protocol for add button, to trigger method form delegate class (view controller) when the add button is pressed
protocol AddButtonDelegate: class {
    func finishedAddingAssigment()
}

class AddAssignmentView: UIView, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    weak var delegate:AddButtonDelegate?
    
    // Creating proeprties to be in the assignment page
    
    // Properties that will hold actual data entered by user
    var assignmentName = String()
    var courseName = String()
    var dueDate = Date()
    var importanceTag = String()
    
    // Labels for each field in the view
    var nameLabel = UILabel()
    var dateLabel = UILabel()
    var classLabel = UILabel()
    var importanceLabel = UILabel()
    
    // The user interactive fields in the view
    var nameField = UITextField()
    var datePicker = UIDatePicker()
    var classPicker = UIPickerView()
    var importancePicker = UIPickerView()
    
    let addButton = UIButton()
    let cancelButton = UIButton()
   
    
    // This is used to preload the courses picker data
    let coursesPickerData = Array(courses.keys)
    let importancePickerData = assignmentImportanceOptions
    
    override init(frame: CGRect) {
        // this takes the frame passed in and assignt it to this views frame,
        // likely will be a bit smaller than the calling view to make a nice apperance but thats decided on later, right now we have other things to worry about
        // anyway it was nice chatting with you
        super.init(frame: frame)
        
// Setup the delegates for the user interactive componenets
        classPicker.delegate = self
        classPicker.dataSource = self
        
        nameField.delegate = self
        
        importancePicker.delegate = self
        importancePicker.dataSource = self
        
        
        

        
        // Basic Add Assignment View Setup stuff
        self.backgroundColor = UIColor.white //(red: 222/255.0, green: 94/255.0, blue: 77/255.0, alpha: 1.0)
        self.layer.cornerRadius = 5
        
// Applying Setup Values, and adding subviews of elements

        // nameLabel
        nameLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        nameLabel.text = "Enter Assignment Name:"
        nameLabel.textColor = UIColor.white
        nameLabel.frame = CGRect(x: 5, y: 5, width: self.frame.width - 10, height: 30)
        self.addSubview(nameLabel)
        
        // nameField
        nameField.frame = CGRect(x: 5, y: nameLabel.frame.maxY + 5, width: self.frame.width - 10, height: 40)
        nameField.backgroundColor = UIColor(red: 92/255.0, green: 94/255.0, blue: 77/255.0, alpha: 0.8)
        nameField.textColor = UIColor.white

        
        self.addSubview(nameField)
        
        // dateLabel
        dateLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        dateLabel.text = "Choose Due Date:"
        dateLabel.textColor = UIColor.black
        dateLabel.frame = CGRect(x: 5, y: nameField.frame.maxY + 5, width: self.frame.width - 10, height: 30)
        self.addSubview(dateLabel)
        
        // datePicker
        datePicker.frame = CGRect(x: 0, y: dateLabel.frame.maxY + 5, width: self.frame.width - 10, height: 70)
        datePicker.datePickerMode = .date
        self.addSubview(datePicker)
        
        
        // classLabel
        classLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        classLabel.text = "Choose Class Name:"
        classLabel.textColor = UIColor.black
        classLabel.frame = CGRect(x: 5, y: datePicker.frame.maxY + 5, width: self.frame.width - 10, height: 30)
        self.addSubview(classLabel)
        
        // classPicker
        classPicker.frame = CGRect(x: 5, y: classLabel.frame.maxY + 5, width: self.frame.width - 10, height: 60)
        classPicker.tag = 1
        self.addSubview(classPicker)

        
        // importanceLabel
        importanceLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        importanceLabel.text = "Assignment Important?"
        importanceLabel.textColor = UIColor.black
        importanceLabel.frame = CGRect(x: 5, y: classPicker.frame.maxY + 5, width: self.frame.width - 10, height: 30)
        self.addSubview(importanceLabel)
        
        // importanceCheck
        importancePicker.frame = CGRect(x: 5, y: classPicker.frame.maxY + 15, width: self.frame.width - 10, height: 60)
        self.addSubview(importancePicker)
        
// Add and Cancel Buttons Setup
        
        // button border color
        let blue = UIColor(red: 65.0/255, green: 147.0/255, blue: 245.0/255, alpha: 1.0)

        // Cancel button
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(UIColor.black, for: .normal)
        cancelButton.backgroundColor = UIColor.white
        cancelButton.layer.borderColor = blue.cgColor
        cancelButton.layer.borderWidth = 1
        
        cancelButton.frame = CGRect(x: 5, y: self.frame.height - 30, width: (self.frame.width / 2) - 10, height: 25)
        cancelButton.layer.cornerRadius = 5
        
        // methods to be invoked when user interacts with this damn button
        cancelButton.addTarget(self, action: #selector(cancelButtonPressed(_:)), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchDown)
        cancelButton.addTarget(self, action: #selector(buttonRelased(_:)), for: .touchDragExit)
        
        self.addSubview(cancelButton)
        
        // Add Button
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(UIColor.black, for: .normal)
        addButton.backgroundColor = UIColor.white
        addButton.layer.borderColor = blue.cgColor
        addButton.layer.borderWidth = 1

        addButton.frame = CGRect(x: cancelButton.frame.maxX + 5, y: self.frame.height - 30, width: (self.frame.width / 2) - 10, height: 25)
        addButton.layer.cornerRadius = 5
        
        // methods to be invoked when user interacts with this damn button
        addButton.addTarget(self, action: #selector(addButtonPressed(_:)), for: .touchUpInside)
        addButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchDown)
        addButton.addTarget(self, action: #selector(buttonRelased(_:)), for: .touchDragExit)
        self.addSubview(addButton)
    }
    
    
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func cancelButtonPressed(_ sender: UIButton){
       // do nothing here, except of course getting rid of the view
        dissmissView()
    }
    
    func addButtonPressed(_ sender: UIButton){
    
        // Assigning Values to data properties
        if let name = nameField.text{
            assignmentName = name
        }
        
        //let formatter = DateFormatter()
        //formatter.dateFormat = "MM/dd/yyyy"
    
        dueDate = datePicker.date
        
        // assinment importance and course name are assigned to data proepties through delegates for the pickers (down below)
        addAssignment(assignmentName, courseName, dueDate, importanceTag)
        
        // this lets the delegate class(view controller) know that we're all done in here adding the asisngment and all that
        delegate?.finishedAddingAssigment()
        
        // Function will remove view form its superview
        self.dissmissView()
    }
    
    
    // this creates the press down and up aniumation of a button
    func buttonPressed(_ button:UIButton){
        button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9);
    }
    func buttonRelased(_ button:UIButton){
        button.transform = CGAffineTransform(scaleX: 1.0, y: 1.0);
    }
    
    
    func dissmissView(){
        
        UIView.animate(withDuration: 0.5, animations: {
            self.addButton.alpha = 0
            self.cancelButton.alpha = 0
            self.nameField.alpha = 0
            self.nameLabel.alpha = 0
            self.dateLabel.alpha = 0
            self.datePicker.alpha = 0
            self.classLabel.alpha = 0
            self.classPicker.alpha = 0
            self.importanceLabel.alpha = 0
            self.importancePicker.alpha = 0
        }, completion: nil)
        
        UIView.animate(withDuration: 1, animations: {
           
            
            self.frame = CGRect(x: self.frame.midX, y: self.frame.midY, width: 1, height: 1)
        }, completion: {
            // this is to be executed after all the animations are done executing
            _ in 
            self.removeFromSuperview()
        })
        
    
    }
    
// Courses Picker Setup
    //Data Sources
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        // number of columns in the picker
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        // numbr of rows in the pikcer
        
        // courses picker has been assinged to tag 1
        if pickerView.tag == 1 {
             return coursesPickerData.count
        }else {
             return importancePickerData.count
        }

    }
    
    // Delegates, used to extract data form the chosen item, and stores it in this case under the couseName property
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        // return the correct values from the pickersdata elements
        
        // courses picker has been assinged to tag 1
        if pickerView.tag == 1 {
            return coursesPickerData[row]
        }else {
            return importancePickerData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // assign the correct values form the pickers to the properties
        
        // courses picker has been assinged to tag 1
        if pickerView.tag == 1 {
            courseName = coursesPickerData[row]
        }else {
            importanceTag = importancePickerData[row]
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }

    
}




























