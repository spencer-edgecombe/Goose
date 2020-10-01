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
    
    struct DetailEntry: Hashable {
        let title: String
        let description: String
        init (_ title: String, _ description: String) {
            self.title = title
            self.description = description
        }
    }
    
    class ViewModel: ObservableObject {
        
        @Published private(set) var course: Course
        @Published private(set) var courseDetails: CourseDetails = CourseDetails()
        @Published private(set) var courseDetailsLoadingState: LoadingState = .loading
        @State var isAlertPresented: Bool = true
        
        private var isMock: Bool

        init(course: Course, _ isMock: Bool = false) {
            self.course = course
            self.isMock = isMock
            self.isSaved = false
            guard !isMock else {
                mockLoadCourseDetails()
                return
            }
            self.isSaved = UserData.shared.isSaved(course: &self.course)
            loadCourseDetails()
        }

        var courseShorthand: String {
            return course.shorthand
        }
        
        var courseDescription: String {
            return course.description
        }
        
        var courseTitle: String {
            return course.title
        }
        
        var prerequisites: String? {
            return courseDetails.prerequisites
        }
        
        @Published private(set) var isSaved: Bool
        
        var detailEntries: [DetailEntry] {
            var entries: [DetailEntry] = []
            if !course.description.isEmpty {
                entries.append(DetailEntry("Description", course.description))
            }
            entries.append(DetailEntry("Units", course.unitsText))
            entries.append(DetailEntry("Academic Level", course.academicLevel))
            if let termsOffered = courseDetails.termsOffered {
                var terms: String = ""
                termsOffered.forEach { (term) in
                    if terms.isEmpty {
                        terms = "\(term)"
                    } else {
                        terms = "\(terms), \(term)"
                    }
                }
                if !terms.isEmpty {
                    entries.append(DetailEntry("Terms Offered", terms))
                }
            }
            if let offerings = courseDetails.offerings {
                var offeringString: String = ""
                offerings.forEach { (offering, hasOffering) in
                    if hasOffering {
                        if offeringString.isEmpty {
                            offeringString = "\(offering)"
                        } else {
                            offeringString = "\(offeringString), \(offering)"
                        }
                    }
                }
                if !offeringString.isEmpty {
                    entries.append(DetailEntry("Offerings", offeringString))
                }
            }
            if let prerequisites = courseDetails.prerequisites {
                entries.append(DetailEntry("Pre-requisites", prerequisites))
            }
            if let antirequisites = courseDetails.antirequisites {
                entries.append(DetailEntry("Anti-requisites", antirequisites))
            }
            if let corequisites = courseDetails.corequisites {
                entries.append(DetailEntry("Co-requisites", corequisites))
            }
            if let instructions = courseDetails.instructions {
                var instructionString: String = ""
                instructions.forEach { (instruction) in
                    if instructionString.isEmpty {
                        instructionString = "\(instruction)"
                    } else {
                        instructionString = "\(instructionString), \(instruction)"
                    }
                }
                if !instructionString.isEmpty {
                    entries.append(DetailEntry("Instructions", instructionString))
                }
            }
            if let notes = courseDetails.notes {
                entries.append(DetailEntry("Notes", notes))
            }
            return entries
        }
        
        func loadCourseDetails() {
            courseDetailsLoadingState = .loading
            Client.shared.courseDetails(for: course.subject, courseNumber: course.catalogNumber) {[weak self] (courseDetails, error) in
                if let weakSelf = self {
                    if let error = error {
                        print(error)
                        weakSelf.courseDetailsLoadingState = .failure(message: error.localizedDescription)
                    } else if let courseDetails = courseDetails {
                        weakSelf.courseDetailsLoadingState = .success
                        weakSelf.courseDetails = courseDetails
                    }
                }
            }
        }
                
        func mockLoadCourseDetails() {
            if let courseDetails = MockClient.courseDetails {
                self.courseDetails = courseDetails
                courseDetailsLoadingState = .success
            }
        }
        
        func saveButtonPressed() {
            guard !isMock else {
                return
            }
            if isSaved && UserData.shared.delete(course: &course) {
                isSaved.toggle()
            } else if !isSaved && UserData.shared.save(course: &course){
                isSaved.toggle()
            }
        }
    }
}

struct CourseCatalogViewModel_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CourseCatalogView(course: Course(courseId: "", subject: "CS", catalogNumber: "246", title: "Object Oriented Software Development", units: 0, description: "Introduction to object-oriented programming and to tools and techniques for software development. Designing, coding, debugging, testing, and documenting medium-sized programs: reading specifications and designing software to implement them; selecting appropriate data structures and control structures; writing reusable code; reusing existing code; basic performance issues; debuggers; test suites.", academicLevel: "Undergraduate"), isMock: true)
        }
    }
}
