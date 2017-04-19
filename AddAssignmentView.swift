//
//  AddAssignmentView.swift
//  Pupil
//
//  Created by Jordan Alnaser on 4/18/17.
//  Copyright © 2017 Jordan Alnaser. All rights reserved.
//

import UIKit


class AddAssignmentView: UIView {

    // Creating proeprties to be in the assignment page
    
    // Labels for each text field in the view
    var nameLabel = UILabel()
    var importanceLabel = UILabel()
    var dateLabel = UILabel()
    
    // the actual fields in the view
    var datePicker = UIDatePicker()
    var nameField = UITextField()
    var importanceCheck = UICheckbox()
    
    override init(frame: CGRect) {
        // this takes the frame passed in and assignt it to this views frame,
        // likely will be a bit smaller than the calling view to make a nice apperance but thats decided on later, right now we have other things to worry about
        // anyway it was nice chatting with you
        super.init(frame: frame)
        
        // Basic Add Assignment View Setup stuff
        self.backgroundColor = UIColor(red: 222/255.0, green: 94/255.0, blue: 77/255.0, alpha: 1.0)
        self.layer.cornerRadius = 5
        
        // Applying Setup Values for the UILabels

        // nameLabel
        nameLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        nameLabel.text = "Enter Assignment Name:"
        
        nameLabel.frame = CGRect(x: 5, y: 5, width: 365, height: 100)
        self.addSubview(nameLabel)
        
        nameField.frame = CGRect(x: 5, y: 75, width: 345, height: 50)
        nameField.backgroundColor = UIColor.white
        
        self.addSubview(nameField)
        
        // dateLabel
        dateLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        dateLabel.text = "Enter Due Date:"
        
        
        // importanceLabel
        importanceLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        importanceLabel.text = "Assignment Important?"
    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
}
