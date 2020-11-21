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
            ResourceView(viewModel: self.viewModel, failurePlaceholderMessage: R.string.localizable.placeholderErrorDetailCourse()) {
                Group {
                    ForEach(viewModel.detailEntries, id: \.self) { entry in
                        CardView(title: entry.title, titleColor: .primary, isLink: false) {
                            Text(entry.description)
                                .bodyFont(isBold: false)
                        }
                        .horizontalPadding()
                    }
                }
            }
        }
        .background(
            Color.background
                .edgesIgnoringSafeArea(.all)
        )
        .navigationTitle(viewModel.course.shorthand)
        .navigationBarItems(trailing: Button(action: viewModel.saveButtonPressed, label: {
            Image(systemName: viewModel.isSaved ? "heart.fill" : "heart")
                .subheadingFont(color: .red)
        }))
    }
    
    init(course: Course, _ isMock: Bool = false) {
        self.viewModel = CourseDetailViewModel(course: course, isMock)
    }

}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CourseDetailView(course: Course(courseId: "", subject: "CS", catalogNumber: "246", title: "Object Oriented Software Development", units: 0, description: "Introduction to object-oriented programming and to tools and techniques for software development. Designing, coding, debugging, testing, and documenting medium-sized programs: reading specifications and designing software to implement them; selecting appropriate data structures and control structures; writing reusable code; reusing existing code; basic performance issues; debuggers; test suites.", academicLevel: "Undergraduate"), true)
        }
    }
}
