//
//  CourseCatalogView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-06-05.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct CourseCatalogView: View {
    var courseModel: CourseModel
    @Environment(\.presentationMode) var presentationMode
    @State var courseDetails: CourseDetails = CourseDetails()
    
   
    
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
    
    var termAvailability: some View {
        HStack(alignment: .center, spacing: .spacing) {
           Text("Term Availability")
               .font(.appLabel)
           Spacer()
           HStack {
               season(imageName: "wind", color: fallColor.value, seasonInitial: "F")
               season(imageName: "snow", color: winterColor.value, seasonInitial: "W")
               season(imageName: "sun.max", color: springColor.value, seasonInitial: "S")
           }
           .frame(alignment: .trailing)
           .padding(.top)
       }
       .padding([.leading, .trailing])
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text(courseModel.course.title)
                        .padding([.leading, .trailing])
                        .foregroundColor(.secondary)
                        .font(.appSubheading)
                    Divider()
                        .padding([.leading, .trailing])
                   
                }
            }
            .navigationBarTitle(courseModel.course.shorthand)
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarItems(leading: Button(action: saveButtonPressed, label: {
                Image(systemName: saveButtonStateObject.value)
                    .font(.appSubheading)
                    .accentColor(UIColor.systemRed.color)
            }), trailing: Button(action: exitButtonPressed, label: {
                Image(systemName: "xmark")
                    .font(.appSubheading)
            }))
            .onAppear(perform: loadData)
        }
    }
    
    func loadData() {
        courseModel.loadCourses { (courseDetails) in
            if let courseDetails = courseDetails {
                self.courseDetails = courseDetails
                debugPrint(courseDetails)
            }
        }
    }
    
    func exitButtonPressed() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func saveButtonPressed() {
        self.saveButtonStateObject.toggle()
    }
}

struct CourseCatalogView_Previews: PreviewProvider {
    static var model: CourseModel = {
        var model = CourseModel(course: Course(courseId: "", subject: "CS", catalogNumber: "246", title: "Object Oriented Software Development", units: 0, description: "Introduction to object-oriented programming and to tools and techniques for software development. Designing, coding, debugging, testing, and documenting medium-sized programs: reading specifications and designing software to implement them; selecting appropriate data structures and control structures; writing reusable code; reusing existing code; basic performance issues; debuggers; test suites.", academicLevel: "Undergraduate"))
        return model
    }()
    static var previews: some View {
        CourseCatalogView(courseModel: model)
    }
}
