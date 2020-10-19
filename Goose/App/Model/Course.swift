//
//  Course.swift
//  UWCourses
//
//  Created by Spencer Edgecombe on 2020-04-22.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

class Course: Resource {
    static func == (lhs: Course, rhs: Course) -> Bool {
        return lhs.courseId == rhs.courseId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(courseId)
    }
    
    var id: UUID = UUID()
    let courseId: String
    let subject: String
    let catalogNumber: String
    let title: String
    let units: Float
    let description: String
    let academicLevel: String
    var facultyCode: FacultyCode = .NONE
    
    var facultyColor: Color {
        return Faculty.color(faculty: facultyCode)
    }
    
    init(courseId: String, subject: String, catalogNumber: String, title: String, units: Float, description: String, academicLevel: String, facultyCode: FacultyCode = .NONE) {
        self.courseId = courseId
        self.subject = subject
        self.catalogNumber = catalogNumber
        self.title = title
        self.units = units
        self.description = description
        self.academicLevel = academicLevel
        self.facultyCode = facultyCode
    }
    
    enum CodingKeys: String, CodingKey {
        case courseId = "course_id"
        case subject
        case catalogNumber = "catalog_number"
        case title
        case units
        case description
        case academicLevel = "academic_level"
    }
    
    var shorthand: String {
        return "\(subject) \(catalogNumber)"
    }
    
    var unitsText: String {
        return String(format: "%.1f", units)
    }
}
