//
//  AssCourseView.swift
//  Pupil
//
//  Created by Jordan Alnaser on 4/22/17.
//  Copyright © 2017 Jordan Alnaser. All rights reserved.

import UIKit

class AddCourseView: UIView {
    // Labels for each field in the view
    var nameLabel = UILabel()
    
    // The user interactive fields in the view
    var nameField = UITextField()
    
    
    let addButton = UIButton()
    let cancelButton = UIButton()
    
    
    override init(frame: CGRect) {
        // this takes the frame passed in and assignt it to this views frame,
        // likely will be a bit smaller than the calling view to make a nice apperance but thats decided on later, right now we have other things to worry about
        // anyway it was nice chatting with you
        super.init(frame: frame)
        
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
        nameLabel.textColor = UIColor.white
        
        
        self.addSubview(nameField)
        
        
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
    
    
    
    func cancelButtonPressed(_ sender: UIButton){
        // do nothing here, except of course getting rid of the view
        self.dissmissView()
    }
    
    func addButtonPressed(_ sender: UIButton){
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
        
        //        UIView.animate(withDuration: 0.5, animations: {
        //            self.addButton.alpha = 0
        //            self.cancelButton.alpha = 0
        //            self.nameField.alpha = 0
        //            self.nameLabel.alpha = 0
        //            self.dateLabel.alpha = 0
        //            self.datePicker.alpha = 0
        //            self.classLabel.alpha = 0
        //            self.classPicker.alpha = 0
        //            self.importanceLabel.alpha = 0
        //            self.importancePicker.alpha = 0
        //        }, completion: nil)
        //
        UIView.animate(withDuration: 1, animations: {
            
            
            self.frame = CGRect(x: self.frame.midX, y: self.frame.midY, width: 1, height: 1)
        }, completion: {
            // this is to be executed after all the animations are done executing
            _ in
            self.removeFromSuperview()
        })
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
