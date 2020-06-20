//
//  SubjectCatalogueView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-19.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct SubjectCatalogueView: View {
    
    var subjectModel: SubjectModel
    
    @State var courses = [Course]()
    @State var courseToShow: Course!
    @State var showCourseModal = false
    
    var body: some View {
        GeometryReader { parentView in
            ScrollView(showsIndicators: false) {
                Divider()
                    .padding()
                Text(self.subjectModel.subjectDescription())
                    .modifier(HeaderViewModifier())
                    .foregroundColor(.secondary)
                    ForEach(self.courses, id: \.self) { course in
                        CourseView(parentViewWidth: parentView.size.width, course: course, groupColor: Goose.groupColor(group: self.subjectModel.subject.group).color
                        ).onTapGesture {
                            self.courseTapped(course: course)
                        }.sheet(isPresented: self.$showCourseModal) {
                            CourseCatalogueView(courseModel: CourseModel(course: course))
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

struct SubjectCatalogueView_Previews: PreviewProvider {
    static var model: SubjectModel {
        let model = SubjectModel(subject: Subject(name: "CS", description: "Computer Science", group: GroupCode.MAT))
        model.mockLoadCourses()
        return model
    }
    static var previews: some View {
        SubjectCatalogueView(subjectModel: model)
    }
}
