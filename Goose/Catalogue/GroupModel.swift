//
//  GroupModel.swift
//  UWCourses
//
//  Created by Spencer Edgecombe on 2020-04-27.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import UIKit

class GroupModel {
    
    var subjects: [Subject]
    var group: Group

    var groupCode: String {
        return group.code.rawValue
    }
    
    var groupName: String {
        return group.name
    }
    
    var groupColor: UIColor {
        return group.color
    }

    init(group: Group, subjects: [Subject]) {
        self.group = group
        self.subjects = subjects
    }
    
    func subject(at row: Int) -> Subject {
        return subjects[row]
    }

    
    func numberOfSubjects() -> Int {
        return subjects.count
    }
    
    
}
