//
//  SubjectListView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-08-31.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI
import UIKit

struct CourseListView: View {
    @ObservedObject var viewModel: CourseListViewModel
    let userInterfaceIdiom = UIDevice.current.userInterfaceIdiom
    var isPadInterface: Bool {
        return userInterfaceIdiom == .pad
    }

    var body: some View {
        ResourceView(viewModel: viewModel, failurePlaceholderMessage: R.string.localizable.placeholderErrorListCourse()) {
            if viewModel.resources.isEmpty {
                NoContentPlaceholder(message: R.string.localizable.placeholderEmptyListCourse())
            } else {
                ScrollView {
                    VStack(alignment: .leading) {
                        Group {
                            ListSectionHeader(text: viewModel.subject.description, color: viewModel.facultyColor, isPadded: false)
                            ForEach(self.viewModel.resources, id: \.self) { course in
                                NavigationLink(destination: CourseDetailView(course: course)) {
                                    CourseView(course: course)
                                        .horizontalPadding()
                                }
                            }
                        }
                    }
                    .bottomPadding()
                }
                .navigationBarTitleDisplayMode(isPadInterface ? .inline : .large)
                .background(
                    Color.background
                        .edgesIgnoringSafeArea(.all)
                )
            }
        }
        .navigationTitle(viewModel.subject.name)
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
