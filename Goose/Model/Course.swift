//
//  Course.swift
//  UWCourses
//
//  Created by Spencer Edgecombe on 2020-04-22.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation

struct Course: Codable, Hashable {
    let courseId: String
    let subject: String
    let catalogueNumber: String
    let title: String
    let units: Float
    let description: String
    let academicLevel: String
    
    enum CodingKeys: String, CodingKey {
        case courseId = "course_id"
        case subject
        case catalogueNumber = "catalog_number"
        case title
        case units
        case description
        case academicLevel = "academic_level"
    }
}
