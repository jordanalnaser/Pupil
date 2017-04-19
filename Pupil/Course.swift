//
//  Course.swift
//  Pupil
//
//  Created by Jordan Alnaser on 3/26/17.
//  Copyright © 2017 Jordan Alnaser. All rights reserved.
//

import UIKit

class Course: NSObject {
    
    // Private Fields
    
    // This will be done to where assignments will be fetched from the calendar object made in the main view
   // var assignments = calendar.getAssignments(courseID: name)
    
    private var name = String()
    private var syllabus = [UIImage?]()
    private var grade:Double? = 0.0
    
    
    init(_ name:String){
        // Class Constructor
        self.name = name
    }

    func addSyllabus(){
        // do stuff here to launch camera, and store pictures into a [UIImage] then assignt it to the optional private field syllabus
    }
    
    func addGrade(_ grade:Double){
        self.grade = grade
    }
    
    func getName() -> String {
        return self.name
    }
}
