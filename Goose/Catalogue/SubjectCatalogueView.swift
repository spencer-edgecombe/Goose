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
    
    var body: some View {
        ScrollView {
            ForEach(subjectModel.courses, id: \.self) { course in
                CourseView(course: course, groupColor: Goose.groupColor(group: self.subjectModel.subject.group).color
                )
            }
        }
    }
}

struct SubjectCatalogueView_Previews: PreviewProvider {
    static var model: SubjectModel {
        let model = SubjectModel(subject: Subject(name: "CS", description: "Computer Science", group: GroupCode.MAT))
        return model
    }
    static var previews: some View {
        SubjectCatalogueView(subjectModel: model)
    }
}
