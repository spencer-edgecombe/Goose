//
//  CourseCatalogueView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-06-05.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct CourseCatalogueView: View {
    var courseModel: CourseModel
    @Environment(\.presentationMode) var presentationMode
    @State var courseDetails: CourseDetails = CourseDetails()
    
    @State var saveButtonStateObject: StateObject<String> = StateObject<String> {
        isSaved in
        return isSaved ? "heart.fill" : "heart"
    }
    
    @State var winterColor: StateObject<Color> = StateObject<Color>(initialValue: true) {
        isAvailable in
        return isAvailable ? UIColor.systemTeal.color : UIColor.tertiaryLabel.color
    }
    
    @State var springColor: StateObject<Color> = StateObject<Color>(initialValue: true) {
        isAvailable in
        return isAvailable ? UIColor.systemYellow.color : UIColor.tertiaryLabel.color
    }
    
    @State var fallColor: StateObject<Color> = StateObject<Color>(initialValue: true) {
        isAvailable in
        return isAvailable ? UIColor.systemOrange.color : UIColor.tertiaryLabel.color
    }
    
    var widgetHeight: CGFloat {
        let str = "S"
        return str.heightWithConstrainedWidth(width: .infinity, font: .appHeading) + str.heightWithConstrainedWidth(width: .infinity, font: .appSmall) + CGFloat.spacing.divide(by: 4) + CGFloat.spacing.multiply(by: 2)
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
                    HStack(alignment: .top, spacing: .spacing) {
                        HStack {
                            VStack {
                                Image(systemName: "wind")
                                    .font(.appHeading)
                                    .foregroundColor(fallColor.value)
                                Text("F")
                                    .font(.appSmall)
                                    .padding(.top, CGFloat.spacing.divide(by: 4))
                            }
                            VStack {
                                Image(systemName: "snow")
                                    .font(.appHeading)
                                    .foregroundColor(winterColor.value)
                                Text("W")
                                    .font(.appSmall)
                                    .padding(.top, CGFloat.spacing.divide(by: 4))
                            }
                            VStack {
                                Image(systemName: "sun.max")
                                    .font(.appHeading)
                                    .foregroundColor(springColor.value)
                                Text("S")
                                    .font(.appSmall)
                                    .padding(.top, CGFloat.spacing.divide(by: 4))

                            }
                        }
                        .padding(.top)
                        
                    }
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

struct CourseCatalogueView_Previews: PreviewProvider {
    static var model: CourseModel = {
        var model = CourseModel(course: Course(courseId: "", subject: "CS", catalogueNumber: "246", title: "Object Oriented Software Development", units: 0, description: "Introduction to object-oriented programming and to tools and techniques for software development. Designing, coding, debugging, testing, and documenting medium-sized programs: reading specifications and designing software to implement them; selecting appropriate data structures and control structures; writing reusable code; reusing existing code; basic performance issues; debuggers; test suites.", academicLevel: "Undergraduate"))
        return model
    }()
    static var previews: some View {
        CourseCatalogueView(courseModel: model)
    }
}
