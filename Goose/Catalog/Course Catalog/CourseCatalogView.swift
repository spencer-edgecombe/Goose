//
//  CourseCatalogView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-06-05.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct CourseCatalogView: View {
    var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var courseDetails: CourseDetails = CourseDetails()
    
    init(course: Course) {
        viewModel = ViewModel(course: course)
    }
   
    
    var widgetHeight: CGFloat {
        let str = "S"
        return str.heightWithConstrainedWidth(width: .infinity, font: .appHeading) + str.heightWithConstrainedWidth(width: .infinity, font: .appSmall) + CGFloat.spacing.divide(by: 4) + CGFloat.spacing.multiply(by: 2)
    }
    
    func season(imageName: String, color: Color, seasonInitial: String) -> some View {
        VStack {
            Image(systemName: imageName)
                .font(.appHeading)
                .foregroundColor(color)
            Text(seasonInitial)
                .font(.appSmall)
                .padding(.top, CGFloat.spacing.divide(by: 4))
        }
    }
    
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text(viewModel.courseTitle)
                        .padding([.leading, .trailing])
                        .foregroundColor(.secondary)
                        .font(.appSubheading)
                    Divider()
                        .padding([.leading, .trailing])
                   
                }
            }
            .navigationBarTitle(viewModel.course.shorthand)
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarItems(trailing: Button(action: exitButtonPressed, label: {
                Image(systemName: "xmark")
                    .font(.appSubheading)
            }))
        }
    }
    
    
    func exitButtonPressed() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct CourseCatalogView_Previews: PreviewProvider {
    
    static var previews: some View {
        CourseCatalogView(course: Course(courseId: "", subject: "CS", catalogNumber: "246", title: "Object Oriented Software Development", units: 0, description: "Introduction to object-oriented programming and to tools and techniques for software development. Designing, coding, debugging, testing, and documenting medium-sized programs: reading specifications and designing software to implement them; selecting appropriate data structures and control structures; writing reusable code; reusing existing code; basic performance issues; debuggers; test suites.", academicLevel: "Undergraduate"))
    }
}
