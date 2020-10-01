//
//  Subject.swift
//  UWCourses
//
//  Created by Spencer Edgecombe on 2020-03-22.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import UIKit



struct Subject: Resource {
    let id = UUID()
    let name:String
    let description:String
    let faculty: FacultyCode
    
    enum CodingKeys: String, CodingKey {
        case name = "subject"
        case description
        case faculty = "group"
    }
}
