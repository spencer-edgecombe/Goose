//
//  CourseDetailViewModel.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-10-01.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

class CourseDetailViewModel: DetailViewModel<CourseDetails> {
    var course: Course
    var facultyColor: Color {
        return course.facultyColor
    }
    @Published private(set) var isSaved: Bool {
        didSet {
            self.objectWillChange.send()
        }
    }
    
    init(course: Course, _ isMock: Bool = false) {
        self.course = course
        if isMock {
            self.isSaved = false
        } else {
            self.isSaved = UserData.shared.isSaved(course: &self.course)
        }
        super.init(Client.shared.courseDetailsURL(course: &self.course), resource: CourseDetails(), isMock)
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
    
    var detailEntries: [DetailEntry] {
        var entries: [DetailEntry] = []
        if !course.description.isEmpty {
            entries.append(DetailEntry(R.string.localizable.headerDetailCourseDescription(), course.description))
        }
        entries.append(DetailEntry(R.string.localizable.headerDetailCourseUnits(), course.unitsText))
        entries.append(DetailEntry(R.string.localizable.headerDetailCourseAcademiclevel(), course.academicLevel))
        if let termsOffered = resource.termsOffered {
            var terms: String = ""
            termsOffered.forEach { (term) in
                if terms.isEmpty {
                    terms = "\(term)"
                } else {
                    terms = "\(terms), \(term)"
                }
            }
            if !terms.isEmpty {
                entries.append(DetailEntry(R.string.localizable.headerDetailCourseTermsoffered(), terms))
            }
        }
        if let offerings = resource.offerings {
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
                entries.append(DetailEntry(R.string.localizable.headerDetailCourseOfferings(), offeringString))
            }
        }
        if let prerequisites = resource.prerequisites {
            entries.append(DetailEntry(R.string.localizable.headerDetailCoursePrerequisites(), prerequisites))
        }
        if let antirequisites = resource.antirequisites {
            entries.append(DetailEntry(R.string.localizable.headerDetailCourseAntirequisites(), antirequisites))
        }
        if let corequisites = resource.corequisites {
            entries.append(DetailEntry(R.string.localizable.headerDetailCourseCorequisites(), corequisites))
        }
        if let instructions = resource.instructions {
            var instructionString: String = ""
            instructions.forEach { (instruction) in
                if instructionString.isEmpty {
                    instructionString = "\(instruction)"
                } else {
                    instructionString = "\(instructionString), \(instruction)"
                }
            }
            if !instructionString.isEmpty {
                entries.append(DetailEntry(R.string.localizable.headerDetailCourseInstructions(), instructionString))
            }
        }
        if let notes = resource.notes {
            entries.append(DetailEntry(R.string.localizable.headerDetailCourseNotes(), notes))
        }
        return entries
    }
    
}
