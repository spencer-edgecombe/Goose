//
//  GroupCatalogView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-15.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct GroupCatalogView: View {
    
    
    
    var viewModel: ViewModel
    
    init(group: Group, subjects: [Subject]) {
        viewModel = ViewModel(group: group, subjects: subjects)
    }
    
    var body: some View {
        
        GeometryReader { parentView in
            ScrollView(showsIndicators: false) {
                Divider()
                    .padding()
                Text(self.viewModel.groupName)
                    .modifier(HeaderViewModifier())
                ForEach (self.viewModel.subjects, id: \.self) { subject in
                    NavigationLink(destination:SubjectCatalogView(subjectModel: SubjectModel(subject: subject))) {
                        SubjectView(subject: subject, width: parentView.size.width-CGFloat.spacing.multiply(by: 2))
                    }
                }
            }
        }
        .navigationBarTitle(self.viewModel.groupCode)
    }
}

struct GroupCatalogView_Previews: PreviewProvider {
    static var subjects: [Subject] {
        let model = CatalogModel()
        model.mockLoadGroups()
        let subjects = model.filter(group: Group(code: .ART, name: "Arts"))
        return subjects
    }
    static var previews: some View {
        GroupCatalogView(group: Group(code: .ART, name: "Arts"), subjects: subjects)
    }
}
