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
    
    static let noNumberLevel: Int = -1
    
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
        let format: String
        if (units / 0.5).truncatingRemainder(dividingBy: 2) == 1 {
            format = "%.1f"
        } else if (units / 0.25).truncatingRemainder(dividingBy: 2) == 1 {
            format = "%.02f"
        } else if Float(Int(units)) == units {
            format = "%.0f"
        } else {
            format = "%.02f"
        }
        return String(format: format, units)
    }
    
    var numberLevel: Int {
        guard let level = Int(catalogNumber) else {
            return Course.noNumberLevel
        }
        return level - level % 100
    }
}
