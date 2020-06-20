//
//  CourseDetails.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-06-05.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation

struct CourseDetails: Codable, Hashable {
    let courseId: String
    let subject: String
    let catalogueNumber: String
    let title: String
    let units: Float
    let description: String
    let academicLevel: String?
    let instructions: [String]?
    let prerequisites: String?
    let antirequisites: String?
    let corequisites: String?
    let termsOffered: [String]?
    let notes: String?
    let offerings: [String: Bool]?
    let needsDepartmentConsent: Bool?
    let needsInstructorConsent: Bool?
    let url: String?
    
    init() {
        courseId = ""
        subject = ""
        catalogueNumber = ""
        title = ""
        units = 0.0
        description = ""
        academicLevel = ""
        instructions = []
        prerequisites = ""
        antirequisites = ""
        corequisites = ""
        termsOffered = []
        notes = ""
        offerings = [:]
        needsDepartmentConsent = false
        needsInstructorConsent = false
        url = ""
    }
    
    
    enum CodingKeys: String, CodingKey {
        case courseId = "course_id"
        case subject
        case catalogueNumber = "catalog_number"
        case title
        case units
        case description
        case academicLevel = "academic_level"
        case instructions
        case prerequisites
        case antirequisites
        case corequisites
        case termsOffered = "terms_offered"
        case notes
        case offerings
        case needsDepartmentConsent = "needs_department_consent"
        case needsInstructorConsent = "needs_instructor_consent"
        case url
    }
}
