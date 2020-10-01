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
        @State var selection: Int = 1
        
        @State private(set) var isAlertPresented: Bool = true

        var subjectName: String {
            return subject.name
        }
        
        var subjectDescription: String {
            return subject.description
        }
        
        var subjectFaculty: FacultyCode {
            return subject.faculty
        }
        
        var color: Color {
            return Faculty.color(faculty: subject.faculty)
        }
        
        init(subject: Subject, isMock: Bool = false) {
            self.subject = subject
            if isMock {
                mockLoadCourses()
                coursesLoadingState = .success
            } else {
                loadCourses()
            }
        }
        
        func mockLoadCourses() {
            if let courses = MockClient.courses {
                coursesLoadingState = .success
                self.courses = courses
            }
        }
        
        func loadCourses() {
            coursesLoadingState = .loading
            Client.shared.courses(for: subject.name) {[weak self] (courses, error) in
                if let weakSelf = self {
                    if let error = error {
                        print(error)
                        weakSelf.coursesLoadingState = .failure(message: error.localizedDescription)
                    } else {
                        weakSelf.coursesLoadingState = .success
                        weakSelf.courses = courses
                    }
                }
            }
        }
    }
}

struct SubjectCatalogViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
