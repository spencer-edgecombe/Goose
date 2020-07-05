//
//  SubjectCatalogView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-19.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct SubjectCatalogView: View {
    
    var subjectModel: SubjectModel
    
    @State var courses = [Course]()
    @State var courseToShow: Course!
    @State var showCourseModal = false
    
    var body: some View {
        GeometryReader { parentView in
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text(self.subjectModel.subjectDescription())
                            .padding([.leading, .trailing])
                            .foregroundColor(.secondary)
                            .font(.appSubheading)
                    Divider()
                        .padding([.leading, .trailing])
                    ForEach(self.courses, id: \.self) { course in
                        CourseView(parentViewWidth: parentView.size.width, course: course, groupColor: Goose.groupColor(group: self.subjectModel.subject.group).color
                        ).onTapGesture {
                            self.courseTapped(course: course)
                        }.sheet(isPresented: self.$showCourseModal) {
                            CourseCatalogView(courseModel: CourseModel(course: course))
                        }
                    }
                }
            }
            .onAppear(perform: self.loadData)
            .navigationBarTitle(self.subjectModel.subjectName())
        }
    }
    
    func loadData() {
        subjectModel.loadCourses { courses in
            self.courses = courses
        }
    }
    
    func courseTapped(course: Course) {
        courseToShow = course
        showCourseModal = true
    }
    
}

struct SubjectCatalogView_Previews: PreviewProvider {
    static var model: SubjectModel {
        let model = SubjectModel(subject: Subject(name: "CS", description: "Computer Science", group: GroupCode.MAT))
        model.mockLoadCourses()
        return model
    }
    static var previews: some View {
        SubjectCatalogView(subjectModel: model)
    }
}
