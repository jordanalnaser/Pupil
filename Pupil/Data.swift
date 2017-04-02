//
//  Data.swift
//  Pupil
//
//  Created by Jordan Alnaser on 3/27/17.
//  Copyright © 2017 Jordan Alnaser. All rights reserved.
//


// This File contains the data stucture holding all of our assignments, which everything else is based off of
// Also it contains functions to:
// 1- retrive specific assignments associaed with a certin class
// 2- add an assignment
// 3- delete a specific assignment passing in an assignment name
// 4- 


import Foundation

// This will be a singleton class where there is only one instance of it accessible to all view controllers in program
    
var assignmentsArray: [String:Assignment]!
    


func getAssignments() -> [String: Assignment]{
    return assignmentsArray
        
}


func addAssignment(_ name:String, _ course:Course, _ dueDate:Date?, _ importance:Bool?){
    
}
    
