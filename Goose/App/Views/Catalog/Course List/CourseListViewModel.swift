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
    var facultyColor: Color {
        return Faculty.color(faculty: subject.faculty)
    }
    init(subject: Subject, _ isMock: Bool = false) {
        self.subject = subject
        let url = Client.shared.coursesURL(subject: &self.subject)
        super.init(url, isMock)
    }
    override func resourcesDidLoadSuccessfully(resources: [Course]) {
        super.resourcesDidLoadSuccessfully(resources: resources)
        resources.forEach { (course) in
            course.facultyCode = subject.faculty
        }
    }
}
