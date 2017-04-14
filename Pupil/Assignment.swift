//
//  Assignment.swift
//  Pupil
//
//  Created by Jordan Alnaser on 3/26/17.
//  Copyright © 2017 Jordan Alnaser. All rights reserved.
//

import UIKit

class Assignment: NSObject {
    // Private Fields
    private var name:String!
    private var course:Course!
    private var dueDate = String()
    private var importance:Bool?
    private var completedFlag:Bool = false
    private var grade:Double!
    
    
    init(_ name:String, _ course:Course, _ dueDate:String, _ importance:Bool?){
        // Class Constructor
        self.name = name
        self.course = course
        self.dueDate = dueDate
        self.importance = importance
    }
    
    
}


