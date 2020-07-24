//
//  CourseCatalogViewModel.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-07-23.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

extension CourseCatalogView {
    
    class ViewModel: ObservableObject {
        
        @Published private(set) var course: Course
        @Published private(set) var courseDetails: CourseDetails = CourseDetails()
        @Published private(set) var coursesLoadingState: LoadingState = .loading

        var courseShorthand: String {
            return course.shorthand
        }
        
        var courseDescription: String {
            return course.description
        }
        
        var courseTitle: String {
            return course.title
        }
        
        init(course: Course) {
            self.course = course
            loadCourseDetails()
        }
        
        
        func loadCourseDetails() {
            Client.shared.courseDetails(for: course.subject, courseNumber: course.catalogNumber) {[weak self] (courseDetails, error) in
                if let weakSelf = self {
                    if let error = error {
                        print(error)
                    } else if let courseDetails = courseDetails {
                        weakSelf.courseDetails = courseDetails
                    }
                }
            }
        }
    }
}

struct CourseCatalogViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
