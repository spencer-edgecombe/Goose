//
//  SubjectModel.swift
//  UWCourses
//
//  Created by Spencer Edgecombe on 2020-04-27.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import UIKit

class SubjectModel {
    
    var subject: Subject
    var courses: [Course]!
    
    init(subject: Subject) {
        self.subject = subject
    }
    
    func loadCourses(completionHandler: @escaping () -> ()) {
        Client.shared.courses(for: subject.name) {[weak self] (courses, error) in
            if let weakSelf = self {
                if let error = error {
                    print(error)
                } else {
                    weakSelf.courses = courses
                }
            }
            DispatchQueue.main.async {
                completionHandler()
            }
        }
    }
    
    func numberOfCourses() -> Int {
        guard let courses = courses else {
            return 0
        }
        return courses.count
    }
    
    func course(at row: Int) -> Course {
        return courses[row]
    }
    
    func groupColor() -> UIColor {
        return Goose.groupColor(group: subject.group)
    }
    
    func subjectName() -> String {
        return subject.name
    }
    
    func subjectDescription() -> String {
        return subject.description
    }
    
}
