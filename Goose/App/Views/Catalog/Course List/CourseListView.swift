//
//  SubjectListView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-08-31.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct CourseListView: View {
    @ObservedObject var viewModel: CourseListViewModel
    var body: some View {
        TitledView(title: viewModel.subject.description, titleColor: viewModel.facultyColor) {
            ResourceView(viewModel: viewModel, failurePlaceholderMessage: "Couldn't Fetch Courses") {
                if viewModel.resources.isEmpty {
                    NoContentPlaceholder(message: "No courses")
                } else {
                    ForEach(self.viewModel.resources, id: \.self) { course in
                        NavigationLink(destination:CourseDetailView(course: course)) {
                            CourseView(course: course)
                        }
                    }
                }
            }
        }
        .navigationTitle(viewModel.subject.name)
        .background(
            UIColor.systemGroupedBackground.color
                .edgesIgnoringSafeArea(.all)
        )
    }
    
    init(subject: Subject, _ isMock: Bool = false) {
        self.viewModel = CourseListViewModel(subject: subject, isMock)
    }
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CourseListView(subject: Subject(name: "CS", description: "Computer Science", faculty: .MAT), true)
        }
    }
}
