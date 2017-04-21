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
    private var dueDate = Date()
    private var importance = String()
    private var completedFlag:Bool = false
    private var grade:Double!
    private var tag:Int = 0
    
    init(_ name:String, _ course:Course, _ dueDate:Date, _ importance:String){
        // Class Constructor
        self.name = name
        self.course = course
        self.dueDate = dueDate
        self.importance = importance
    }
    
    
    func editAssignment(_ name:String, _ dueDate:Date, _ importance:String){
        
    }
    
    func getID() -> String{
        // this returns the assignment id which is made up of the name of the assignment and its course name
        return name+course.getName()
    }
    
    func getName() ->String {
        return name
    }

}


