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

// This will be a singleton where there is only one instance of it accessible to everything else in program
    
var assignments = [String : Assignment]()
var courses = [String: Course]()


func getAssignments() -> [String : Assignment]{
    return assignments
        
}

// Search for a course in the diconary of courses
func findCourse(_ name:String) -> Bool{
    for course in courses {
        if(course.key == name){
        // course found in dictonary
            return true
        }
    }
    
    //course not found in dicaotnary
    return false
}

func addCourse(_ name:String){
    // adding to courses dicaonary a new course with the name given, and using the name as the key
    courses[name] = Course(name)
}

func deleteCourse(_ courseKey:String){
    if courses[courseKey] != nil {
        //        assignment exists, not get rid of it
        courses.removeValue(forKey: courseKey)
    } else{
        //        Course doesnt exist, throw an error to be handleded later
    }
}

func addAssignment(_ name:String, _ courseName:String, _ dueDate:String, _ importance:Bool?){
    // Add new assingment to assignments dicnoarty 
    if findCourse(courseName){
        // Course exists, add assignment, and tie it to that course (using a combination of assignment name and course name as key for this aqssingment)
        assignments[String(name + courseName)] = Assignment(name, courses[courseName]!, dueDate, importance)
    }else{
        // Error would be thrown here to be hadnled by calling function
    }
}


func deleteAssignment(_ assignmentKey:String){
    if assignments[assignmentKey] != nil {
//        assignment exists, not get rid of it
        assignments.removeValue(forKey: assignmentKey)
    } else{
//        assignment doesnt exist, throw an error to be handleded later
    }
}
    
