//
//  FacultyCatalogView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-15.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct FacultyCatalogView: View {
    
    var viewModel: ViewModel
    
    init(faculty: Faculty, subjects: [Subject]) {
        viewModel = ViewModel(faculty: faculty, subjects: subjects)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            if viewModel.subjects.isEmpty {
                NoContentPlaceholder(message: "No Subjects")
            }
            ForEach (self.viewModel.subjects, id: \.self) { subject in
                NavigationLink(destination: CourseListView(subject: subject)) {
                    SubjectRow(subject: subject, false)
                }
            }
        }
        .padding(.top, .halfSpacing)
        .navigationBarTitle(self.viewModel.facultyName)
    }
}

struct FacultyCatalogView_Previews: PreviewProvider {
    static var subjects: [Subject] {
        if let subjects = MockClient.subjects {
            return subjects
        }
        return []
    }
    static var previews: some View {
        NavigationView {
            FacultyCatalogView(faculty: Faculty(code: .ART, name: "Arts"), subjects: subjects)
        }
    }
}
