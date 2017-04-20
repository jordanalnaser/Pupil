//
//  AddAssignmentView.swift
//  Pupil
//
//  Created by Jordan Alnaser on 4/18/17.
//  Copyright © 2017 Jordan Alnaser. All rights reserved.
//

import UIKit


class AddAssignmentView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {

    // Creating proeprties to be in the assignment page
    
    // Properties that will hold actual data entered by user
    var assignmentName = String()
    var courseName = String()
    var dueDate = String()
    var importanceTag = false
    
    // Labels for each field in the view
    var nameLabel = UILabel()
    var dateLabel = UILabel()
    var classLabel = UILabel()
    var importanceLabel = UILabel()
    
    // The user interactive fields in the view
    var nameField = UITextField()
    var datePicker = UIDatePicker()
    var classPicker = UIPickerView()
    var importanceCheck = UIButton()
    
    let addButton = UIButton()
    let cancelButton = UIButton()
   
    
    // This is used to preload the courses picker data
    let pickerData = Array(courses.keys)
    
    override init(frame: CGRect) {
        // this takes the frame passed in and assignt it to this views frame,
        // likely will be a bit smaller than the calling view to make a nice apperance but thats decided on later, right now we have other things to worry about
        // anyway it was nice chatting with you
        super.init(frame: frame)
        
// Setup the delegates for the user interactive componenets
        classPicker.delegate = self
        classPicker.dataSource = self
        

        
        // Basic Add Assignment View Setup stuff
        self.backgroundColor = UIColor(red: 222/255.0, green: 94/255.0, blue: 77/255.0, alpha: 1.0)
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
        nameLabel.textColor = UIColor.white

        
        self.addSubview(nameField)
        
        // dateLabel
        dateLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        dateLabel.text = "Choose Due Date:"
        dateLabel.textColor = UIColor.white
        dateLabel.frame = CGRect(x: 5, y: nameField.frame.maxY + 5, width: self.frame.width - 10, height: 30)
        self.addSubview(dateLabel)
        
        // datePicker
        datePicker.frame = CGRect(x: 0, y: dateLabel.frame.maxY + 5, width: self.frame.width - 10, height: 70)
        self.addSubview(datePicker)
        
        
        // classLabel
        classLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        classLabel.text = "Choose Class Name:"
        classLabel.textColor = UIColor.white
        classLabel.frame = CGRect(x: 5, y: datePicker.frame.maxY + 5, width: self.frame.width - 10, height: 30)
        self.addSubview(classLabel)
        
        // classPicker
        classPicker.frame = CGRect(x: 5, y: classLabel.frame.maxY + 5, width: self.frame.width - 10, height: 60)
        
        self.addSubview(classPicker)

        
        // importanceLabel
        importanceLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        importanceLabel.text = "Assignment Important?"
        importanceLabel.textColor = UIColor.white
        importanceLabel.frame = CGRect(x: 5, y: classPicker.frame.maxY + 5, width: self.frame.width - 10, height: 30)
        self.addSubview(importanceLabel)
        
        // importanceCheck
        importanceCheck.frame = CGRect(x: 0, y: importanceLabel.frame.maxY + 5, width: 50, height: 50)
        self.addSubview(importanceCheck)
        
// Add and Cancel Buttons Setup
        // Cancel button
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(UIColor.white, for: .normal)
        cancelButton.backgroundColor = UIColor.blue
        cancelButton.frame = CGRect(x: 5, y: self.frame.height - 30, width: (self.frame.width / 2) - 10, height: 20)
        
        cancelButton.addTarget(self, action: #selector(cancelButtonPressed(_:)), for: .touchUpInside)
        
        self.addSubview(cancelButton)
        
        // Add Button
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(UIColor.white, for: .normal)
        addButton.backgroundColor = UIColor.blue
        addButton.frame = CGRect(x: cancelButton.frame.maxX + 5, y: self.frame.height - 30, width: (self.frame.width / 2) - 10, height: 20)
        
        addButton.addTarget(self, action: #selector(addButtonPressed(_:)), for: .touchUpInside)
        
        self.addSubview(addButton)
    }
    
    
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func cancelButtonPressed(_ sender: UIButton){
       
        print("Cance button pressed")
    }
    
    func addButtonPressed(_ sender: UIButton){
        
        print("Add button pressed")
        
        // Assigning Values to data properties
        if let name = nameField.text{
            assignmentName = name
        }
        
        dueDate = String(describing: datePicker.date)
        
        addAssignment(assignmentName, courseName, dueDate, importanceTag)
        
        self.removeFromSuperview()
    }
    
    
    
    
// Courses Picker Setup
    //Data Sources
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        // number of columns in the picker
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        // numbr of rows in the pikcer
        return pickerData.count
    }
    
    // Delegates, used to extract data form the chosen item, and stores it in this case under the couseName property
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // assign the course name property to the chosen course from the picker
        courseName = pickerData[row]
    }

    
}




























