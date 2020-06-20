//
//  GroupCatalogueView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-15.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct GroupCatalogueView: View {
    var group: Group
    var subjects: [Subject]
    var body: some View {
        
        GeometryReader { parentView in
            ScrollView(showsIndicators: false) {
                Divider()
                    .padding()
                Text(self.group.name)
                    .modifier(HeaderViewModifier())
                ForEach (self.subjects, id: \.self) { subject in
                    NavigationLink(destination:SubjectCatalogueView(subjectModel: SubjectModel(subject: subject))) {
                        SubjectView(subject: subject, width: parentView.size.width-CGFloat.spacing.multiply(by: 2))
                    }
                }
            }
        }
        .navigationBarTitle(group.code.rawValue)
    }
}

struct GroupCatalogueView_Previews: PreviewProvider {
    static var subjects: [Subject] {
        let model = CatalogueModel()
        model.mockLoadGroups()
        let subjects = model.filter(group: Group(code: .ART, name: "Arts"))
        return subjects
    }
    static var previews: some View {
        GroupCatalogueView(group: Group(code: .ART, name: "Arts"), subjects: subjects)
    }
}
