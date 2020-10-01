//
//  File.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-10-01.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

class SubjectListViewModel: ListViewModel<Subject> {
    
    init(_ isMock: Bool = false) {
        super.init(Client.shared.subjectsURL(), isMock)
    }
    
    func filter(faculty: Faculty) -> [Subject] {
        return resources.filter { (subject) -> Bool in
            return faculty.code == subject.faculty
        }
    }
}
