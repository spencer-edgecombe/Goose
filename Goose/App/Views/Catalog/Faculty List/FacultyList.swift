//
//  FacultyList.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-10-18.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct FacultyListView: View {
    
    @ObservedObject var viewModel: FacultyListViewModel

    init(_ isMock: Bool = false) {
        viewModel = FacultyListViewModel(isMock)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: .spacing) {
            ResourceView(viewModel: viewModel, failurePlaceholderMessage: R.string.localizable.placeholderErrorListFaculty()) {
                if viewModel.resources.isEmpty {
                    NoContentPlaceholder(message: R.string.localizable.placeholderEmptyListFaculty())
                } else {
                    List {
                        Section(header:
                                    ListSectionHeader(text: R.string.localizable.headerListFaculty(), color: .yellow)
                        ) {
                            ForEach(viewModel.resources, id: \.self) { faculty in
                                
                                NavigationLink(destination: SubjectListView(faculty: faculty)) {
                                    FacultyRow(faculty: faculty)
                                }
                                .isDetailLink(false)
                            }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
        }
        .navigationTitle(R.string.localizable.titleCatalog())
    }
}

struct FacultyList_Previews: PreviewProvider {
    static var previews: some View {
        FacultyListView(true)
    }
}
