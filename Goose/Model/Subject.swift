//
//  Subject.swift
//  UWCourses
//
//  Created by Spencer Edgecombe on 2020-03-22.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import UIKit



struct Subject : Codable, Hashable, Identifiable {
    let id = UUID()
    let name:String
    let description:String
    let group: GroupCode
    
    enum CodingKeys: String, CodingKey {
        case name = "subject"
        case description
        case group
    }
}
