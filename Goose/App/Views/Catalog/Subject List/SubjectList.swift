//
//  SubjectList.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-10-18.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct SubjectListView: View {
    var viewModel: SubjectListViewModel

    init(faculty: Faculty, _ isMock: Bool = false) {
        self.viewModel = SubjectListViewModel(faculty: faculty)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: .spacing) {
            ResourceView(viewModel: viewModel, failurePlaceholderMessage: "Couldn't Load Subjects") {
                if viewModel.resources.isEmpty {
                    NoContentPlaceholder(message: "No subjects")
                } else {
                    List(viewModel.resources, id: \.self) { subject in
                        NavigationLink(destination: CourseListView(subject: subject)) {
                            SubjectRow(subject: subject)
                        }
                        .isDetailLink(false)
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
        }
        .navigationTitle("Choose a subject")
    }
}

struct SubjectList_Previews: PreviewProvider {
    static var previews: some View {
        SubjectListView(faculty: Faculty(code: .MAT, name: "Math"), true)
    }
}
