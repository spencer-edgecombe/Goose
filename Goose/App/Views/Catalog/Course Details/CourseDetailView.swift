//
//  CourseDetailView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-09-05.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct CourseDetailView: View {
    
    @ObservedObject var viewModel: CourseDetailViewModel
    
    var body: some View {
        TitledView(title: viewModel.course.title, titleColor: viewModel.facultyColor) {
            ResourceView(viewModel: self.viewModel, failurePlaceholderMessage: "Couldn't load course details", failureAlertMessage: "Something went wrong") {
                Group {
                    ForEach(viewModel.detailEntries, id: \.self) { entry in
                        Text(entry.title)
                            .bodyFont()
                            .horizontalPadding()
                        
                        Text(entry.description)
                            .bodyFont(isBold: false)
                            .horizontalPadding()
                            .bottomPadding(.halfSpacing)
                    }
                }
            }
        }
        .navigationTitle(viewModel.course.shorthand)
        .navigationBarItems(trailing: Button(action: viewModel.saveButtonPressed, label: {
            Image(systemName: viewModel.isSaved ? "heart.fill" : "heart")
                .subheadingFont(color: .red)
        }))
    }
    
    init(course: Course, facultyColor: Color) {
        self.viewModel = CourseDetailViewModel(course: course, facultyColor: facultyColor)
    }

}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CourseDetailView(course: Course(courseId: "", subject: "CS", catalogNumber: "246", title: "Object Oriented Software Development", units: 0, description: "Introduction to object-oriented programming and to tools and techniques for software development. Designing, coding, debugging, testing, and documenting medium-sized programs: reading specifications and designing software to implement them; selecting appropriate data structures and control structures; writing reusable code; reusing existing code; basic performance issues; debuggers; test suites.", academicLevel: "Undergraduate"), facultyColor: Faculty.color(faculty: .MAT))
        }
    }
}
