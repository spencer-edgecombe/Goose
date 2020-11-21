//
//  CoursePlanView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-09-04.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct CoursePlanView: View {
    
    @ObservedObject var viewModel: CoursePlanViewModel = CoursePlanViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    if viewModel.savedCourses.isEmpty {
                        NoContentPlaceholder(message: R.string.localizable.placeholderEmptyListSaved())
                    } else {
                        ForEach(viewModel.savedCourses, id: \.self) {
                            course in
                            NavigationLink(destination: CourseDetailView(course: course)) {
                                CourseView(course: course)
                                    .horizontalPadding()
                            }
                        }
                    }
                }
                .bottomPadding()
            }
            .background(
                Color.background
                    .edgesIgnoringSafeArea(.all)
            )
            .navigationTitle(R.string.localizable.titleCourseplanner())
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
    }
}

class CoursePlanViewModel: ObservableObject {
    @Published var savedCourses: [Course]
    init() {
        savedCourses = UserData.shared.savedCourses
        UserData.shared.coursePlanViewModel = self
    }
}

struct CoursePlanView_Previews: PreviewProvider {
    static var previews: some View {
        CoursePlanView()
    }
}
