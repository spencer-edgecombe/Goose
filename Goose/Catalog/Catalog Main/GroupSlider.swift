//
//  GroupSlider.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-15.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct GroupSlider: View {
    
    var model: CatalogModel
    
    var groupViewWidth: CGFloat
    
    var groupViewHeight: CGFloat {
        return groupViewWidth.divide(by: CGFloat.phi.power(of: 0.5))
    }
    
    @State var groups = [Group]()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Spacer(minLength: 2*CGFloat.spacing)
                HStack {
                    ForEach(groups, id: \.self) {
                        group in
                        HStack{
                            Spacer(minLength: CGFloat.spacing)
                            NavigationLink(destination: GroupCatalogView(group: group, subjects: self.model.filter(group: group))) {
                                GroupView(group: group, groupViewWidth: self.groupViewWidth)
                            }
                        }
                    }
                }
                .frame(minHeight: groupViewHeight)
                .padding(.bottom, .spacing)
            }
        }
    .onAppear(perform: loadData)
    }
    
    func loadData() {
        model.loadGroups { groups in
            self.groups = groups
        }
    }
}

struct GroupSlider_Previews: PreviewProvider {
    static var model: CatalogModel {
        let model = CatalogModel()
        model.mockLoadGroups()
        return model
    }
    static var previews: some View {
        GroupSlider(model: model, groupViewWidth: CGFloat(343).divide(by: CGFloat.phi.power(of: 2)))
    }
}
