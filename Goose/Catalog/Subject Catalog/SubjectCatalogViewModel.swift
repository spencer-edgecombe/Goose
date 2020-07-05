//
//  SubjectCatalogViewModel.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-06-27.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

extension SubjectCatalogView {
    
    class ViewModel: ObservableObject {
        
        @Published private(set) var subject: Subject
        @Published private(set) var courses: [Course]  = []
        @Published private(set) var coursesLoadingState: LoadingState = .loading

        init(subject: Subject) {
            self.subject = subject
            loadCourses()
        }
        
        func loadCourses() {
            Client.shared.courses(for: subject.name) {[weak self] (courses, error) in
                if let weakSelf = self {
                    if let error = error {
                        print(error)
                    } else {
                        weakSelf.courses = courses
                    }
                }
            }
        }
    }
}
