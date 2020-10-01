//
//  CourseCatalogView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-06-05.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct CourseCatalogView: View {
    @ObservedObject var viewModel: ViewModel
    var facultyColor: Color
    init(course: Course, facultyColor: Color = .secondary, isMock: Bool = false) {
        viewModel = ViewModel(course: course, isMock)
        self.facultyColor = facultyColor
    }
    
    var successView: some View {
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
    
    var failureView: some View {
        Group {
            NoContentPlaceholder(message: "Couldn't load")
                .alert(isPresented: viewModel.$isAlertPresented, content: {
                    Alert(title: Text("Oops")
                          , message: Text("There was a problem!")
                          , dismissButton: .default(Text("Okay")))
                })
            CenterButton(title: "Reload") {
                viewModel.loadCourseDetails()
            }
        }
    }
    
    var loadingView: some View {
        Group {
            LoadingPlaceholder()
        }
    }
    
    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text(viewModel.courseTitle)
                        .horizontalPadding()
                        .foregroundColor(facultyColor)
                        .font(.appSubheading)
                    Divider()
                        .horizontalPadding()
                        .bottomPadding()
                    if case .success = viewModel.courseDetailsLoadingState {
                        successView
                    } else if case .failure = viewModel.courseDetailsLoadingState {
                        failureView
                    } else if case .loading = viewModel.courseDetailsLoadingState {
                        loadingView
                    }
                    
                }
            }
            .navigationBarTitle(viewModel.course.shorthand)
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarItems(trailing: Button(action: viewModel.saveButtonPressed, label: {
                Image(systemName: viewModel.isSaved ? "heart.fill" : "heart")
                    .subheadingFont(color: .red)
            }))
    }
    
}

struct CourseCatalogView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            CourseCatalogView(course: Course(courseId: "", subject: "CS", catalogNumber: "246", title: "Object Oriented Software Development", units: 0, description: "Introduction to object-oriented programming and to tools and techniques for software development. Designing, coding, debugging, testing, and documenting medium-sized programs: reading specifications and designing software to implement them; selecting appropriate data structures and control structures; writing reusable code; reusing existing code; basic performance issues; debuggers; test suites.", academicLevel: "Undergraduate"), facultyColor: Faculty.color(faculty: .MAT), isMock: true)
        }
    }
}
