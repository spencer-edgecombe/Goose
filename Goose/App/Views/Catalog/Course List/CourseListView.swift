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
            ResourceView(viewModel: viewModel, failurePlaceholderMessage: "Couldn't Fetch Courses", failureAlertMessage: "Something went wrong...") {
                ForEach(self.viewModel.resources, id: \.self) { course in
                    NavigationLink(destination:CourseDetailView(course: course, facultyColor: viewModel.facultyColor)) {
                        CourseView(course: course, color: viewModel.facultyColor)
                            .verticalPadding(.halfSpacing)
                    }
                }
            }
        }.navigationTitle(viewModel.subject.name)
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
