//
//  CourseModel.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-06-05.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation

class CourseModel {
    
    var course: Course
    var courseDetails: CourseDetails!

    init(course: Course) {
        self.course = course
    }
    
    func loadCourses(completionHandler: @escaping (CourseDetails?) -> ()) {
        Client.shared.courseDetails(for: course.subject, courseNumber: course.catalogNumber) { [weak self] (courseDetails, error) in
            if let weakSelf = self {
                if let error = error {
                    print(error)
                } else {
                    weakSelf.courseDetails = courseDetails
                }
            }
            DispatchQueue.main.async {
                completionHandler(courseDetails)
            }
        }
    }
    
}
