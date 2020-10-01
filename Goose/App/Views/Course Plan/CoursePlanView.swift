//
//  CoursePlanView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-09-04.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct CoursePlanView: View {
    @ObservedObject var viewModel: CoursePlanViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    PaddedDivider()
                    HeaderView(title: "Saved")
                        .bottomPadding(.halfSpacing)
                    ForEach(viewModel.savedCourses, id: \.self) {
                        course in
                        NavigationLink(destination: CourseDetailView(course: course, facultyColor: .blue)) {
                            CourseView(course: course, color: .blue)
                        }
                    }
                }
            }
            .navigationTitle("Course Plan")
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
        .onAppear {
            viewModel.loadCourses()
        }
    }
    
    init(_ isMock: Bool = false) {
        viewModel = CoursePlanViewModel(isMock)
    }
}

struct CoursePlanView_Previews: PreviewProvider {
    static var previews: some View {
        CoursePlanView(true)
    }
}
