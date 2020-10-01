//
//  CourseListViewModel.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-10-01.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

class CourseListViewModel: ListViewModel<Course> {
    var subject: Subject
    let facultyColor: Color
    init(subject: Subject, _ isMock: Bool = false) {
        self.subject = subject
        self.facultyColor = Faculty.color(faculty: subject.faculty)
        let url = Client.shared.coursesURL(subject: &self.subject)
        super.init(url, isMock)
    }
}
