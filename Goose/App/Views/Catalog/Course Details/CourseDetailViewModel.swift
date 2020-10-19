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
            entries.append(DetailEntry("Description", course.description))
        }
        entries.append(DetailEntry("Units", course.unitsText))
        entries.append(DetailEntry("Academic Level", course.academicLevel))
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
                entries.append(DetailEntry("Terms Offered", terms))
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
                entries.append(DetailEntry("Offerings", offeringString))
            }
        }
        if let prerequisites = resource.prerequisites {
            entries.append(DetailEntry("Pre-requisites", prerequisites))
        }
        if let antirequisites = resource.antirequisites {
            entries.append(DetailEntry("Anti-requisites", antirequisites))
        }
        if let corequisites = resource.corequisites {
            entries.append(DetailEntry("Co-requisites", corequisites))
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
                entries.append(DetailEntry("Instructions", instructionString))
            }
        }
        if let notes = resource.notes {
            entries.append(DetailEntry("Notes", notes))
        }
        return entries
    }
    
}
