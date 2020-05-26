//
//  GroupSlider.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-15.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct GroupSlider: View {
    
    var model: CatalogueModel
    
    var groupViewWidth: CGFloat
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Spacer(minLength: 2*CGFloat.spacing)
                HStack {
                    ForEach(model.groups, id: \.self) {
                        group in
                        HStack{
                            Spacer(minLength: CGFloat.spacing)
                            NavigationLink(destination: GroupCatalogueView(group: group, subjects: self.model.filter(group: group))) {
                                GroupView(group: group, groupViewWidth: self.groupViewWidth)
                            }
                        }
                    }
                }
            .padding(.bottom, .spacing)
            }
        }
    }
}

struct GroupSlider_Previews: PreviewProvider {
    static var model: CatalogueModel {
        let model = CatalogueModel()
        model.mockLoadGroups()
        return model
    }
    static var previews: some View {
        GroupSlider(model: model, groupViewWidth: CGFloat(343).divide(by: CGFloat.phi.power(of: 2)))
    }
}
