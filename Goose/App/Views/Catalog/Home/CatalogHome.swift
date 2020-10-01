//
//  CatalogHome.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-09-19.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct CatalogHome: View {
    @ObservedObject var subjectListViewModel: SubjectListViewModel
    @ObservedObject var facultyListViewModel: FacultyListViewModel
    
    var body: some View {
        GeometryReader { parent in
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    PaddedDivider()
                    HeaderView(title: .catalogMainFacultiesHeader)
                    ResourceView(viewModel: self.facultyListViewModel, failurePlaceholderMessage: "Couldn't load faculties", failureAlertMessage: "Something went wrong") {
                        LazyVGrid(columns: Array(repeating: GridItem( spacing: CGFloat.spacing, alignment: .top), count: 2)) {
                            ForEach(self.facultyListViewModel.displayedFaculties, id: \.self) { faculty in
                                NavigationLink(destination:FacultyCatalogView(faculty: faculty, subjects: self.subjectListViewModel.filter(faculty: faculty))) {
                                    FacultyView(faculty: faculty)
                                        .frame(height: (parent.size.width/2.0 - CGFloat.spacing*1.5)/CGFloat.phi.power(of: 0.5))
                                }
                            }
                        }
                        .padding([.leading, .trailing])
                        ExpandButton(isExpanded: self.facultyListViewModel.$isFacultiesExpanded)
                    }
                    HeaderView(title: .catalogMainSubjectsHeader)
                        .topPadding()
                    ResourceView(viewModel: subjectListViewModel, failurePlaceholderMessage: "Couldn't load subjects", failureAlertMessage: "Something went wrong") {
                        VStack(alignment: .leading, spacing: .spacing) {
                            ForEach(self.subjectListViewModel.resources, id: \.self) { subject in
                                NavigationLink(destination: CourseListView(subject: subject)) {
                                    SubjectRow(subject: subject)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(String.catalogTitle)
        }
    }
    
    init(_ isMock: Bool = false) {
        subjectListViewModel = SubjectListViewModel(isMock)
        facultyListViewModel = FacultyListViewModel(isMock)
    }
}

struct CatalogHome_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Catalog(true)
        }
    }
}
