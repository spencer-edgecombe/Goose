//
//  UserData.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-09-03.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import SwiftUI

class UserData {
    
    static var shared: UserData = {
      return UserData()
    }()
    
    private var coursesData: [NSManagedObject] = []
    private var courses: [String:Bool] = [:]
    
    var coursePlanViewModel: CoursePlanViewModel?
    
    var savedCourses: [Course] = []
    
    init() {
        load()
    }
    
    func isSaved(course: inout Course) -> Bool{
        return courses[course.courseId] != nil
    }
    
    func save(course: inout Course) -> Bool {
        
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
            return false
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let entity =
            NSEntityDescription.entity(forEntityName: "CourseData",
                                       in: managedContext)!
        
        let courseData = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        courseData.setValuesForKeys(["courseId": course.courseId,
                                 "academicLevel": course.academicLevel,
                                 "units": course.units,
                                 "catalogNumber": course.catalogNumber,
                                 "courseDescription": course.description,
                                 "subject": course.subject,
                                 "title": course.title,
                                 "facultyCode": course.facultyCode.rawValue
                                ])
        
        do {
            try managedContext.save()
            coursesData.append(courseData)
            courses[course.courseId] = true
            if let index = savedCourses.firstIndex(where: { (courseAtIndex) -> Bool in
                course.shorthand <= courseAtIndex.shorthand
            }) {
                savedCourses.insert(course, at: index)
            } else {
                savedCourses.append(course)
            }
            guard let coursePlanViewModel = coursePlanViewModel else {
                return true
            }
            coursePlanViewModel.savedCourses = savedCourses
            return true
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return false
        }
    }
    
    func delete(course: inout Course) -> Bool {
        
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
            return false
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        guard let objectIndex: Int = coursesData.firstIndex (where: { (courseData) -> Bool in
            guard let courseId: String = courseData.value(forKey: "courseId") as? String else {
                return false
            }
            return courseId == course.courseId
        }) else {
            return false
        }
        
        let object = coursesData[objectIndex]
        
        managedContext.delete(object)
        coursesData.remove(at: objectIndex)
        courses.removeValue(forKey: course.courseId)
        if let index = savedCourses.firstIndex(where: { (courseAtIndex) -> Bool in
            return course.courseId == courseAtIndex.courseId
        }) {
            savedCourses.remove(at: index)
        }
        return true
       
    }

    func load() {

        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "CourseData")
        
        do {
            coursesData = try managedContext.fetch(fetchRequest)
            courses = [:]
            coursesData.forEach { (object) in
                guard let title: String = object.value(forKey: "title") as? String,
                   let subject: String = object.value(forKey: "subject") as? String,
                   let academicLevel: String = object.value(forKey: "academicLevel") as? String,
                   let description: String = object.value(forKey: "courseDescription") as? String,
                   let units: Float = object.value(forKey: "units") as? Float,
                   let courseId: String = object.value(forKey: "courseId") as? String,
                   let facultyCode: String = object.value(forKey: "facultyCode") as? String,
                   let catalogNumber: String = object.value(forKey: "catalogNumber") as? String else {
                    return
                }
                courses[courseId] = true
                savedCourses.append(Course(courseId: courseId,
                              subject: subject,
                              catalogNumber: catalogNumber,
                              title: title, units: units,
                              description: description,
                              academicLevel: academicLevel,
                              facultyCode: FacultyCode.init(rawValue: facultyCode) ?? .NONE))
            }
            savedCourses.sort {
                return $0.shorthand < $1.shorthand
            }
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    

}

