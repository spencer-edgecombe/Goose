//
//  SubjectCatalogView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-19.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct SubjectCatalogView: View {
    
    var viewModel: ViewModel
    @State var isModalPresented: Bool = false
    
    init(subject: Subject, isMock: Bool = false) {
        self.viewModel = ViewModel(subject: subject, isMock: isMock)
    }
    
    var successView: some View {
        Group {
            if viewModel.courses.isEmpty {
                NoContentPlaceholder(message: "No Courses")
            }
            ForEach(self.viewModel.courses, id: \.self) { course in
                NavigationLink(destination:CourseCatalogView(course: course, facultyColor: self.viewModel.color)) {
                    CourseView(course: course, color: viewModel.color)
                }
            }
        }
    }
    
    var failureView: some View {
        Group {
            NoContentPlaceholder(message: "Couldn't load")
                .alert(isPresented: viewModel.$isAlertPresented, content: {
                    Alert(title: Text("Oops")
                          , message: Text("There was a problem!")
                          , dismissButton: .default(Text("Okay")))
                })
            CenterButton(title: "Reload") {
                viewModel.loadCourses()
            }
        }
    }
    
    var loadingView: some View {
        Group {
            LoadingPlaceholder()
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading, spacing: .spacing) {
                Text(viewModel.subjectDescription)
                    .headingFont(color: viewModel.color)
                    .padding(.top, -.halfSpacing)
                    .padding(.leading)
                Divider()
                    .horizontalPadding()
                if case .success = viewModel.coursesLoadingState {
                    successView
                } else if case .failure = viewModel.coursesLoadingState {
                    failureView
                } else if case .loading = viewModel.coursesLoadingState {
                    loadingView
                }
            }
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        .navigationBarTitle(viewModel.subjectName)
            
    }
    
    
    func courseTapped(course: Course) {
        isModalPresented.toggle()
    }
    
}

struct SubjectCatalogView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            SubjectCatalogView(subject: Subject(name: "CS", description: "Computer Science", faculty: FacultyCode.MAT), isMock: true)
        }
    }
}
