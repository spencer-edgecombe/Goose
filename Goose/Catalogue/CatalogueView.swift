//
//  CatalogueView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-14.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct CatalogueView: View {
    
    var model: CatalogueModel
    
    func groupViewWidth(width: CGFloat) -> CGFloat {
        return width.advanced(by: -CGFloat.spacing.multiply(by: 2)).divide(by: CGFloat.phi)
    }
    
    func subjectViewWidth(parentViewWidth width: CGFloat) -> CGFloat {
        return width - CGFloat.spacing.multiply(by: 2)
    }
    
    func subjectViewHeight(parentViewWidth width: CGFloat) -> CGFloat {
        return subjectViewWidth(parentViewWidth: width).divide(by: CGFloat.phi.power(of: 3))
    }
    
    var body: some View {
            NavigationView {
                GeometryReader {
                parentView in
                ScrollView {
                    VStack{
                        Divider()
                            .padding(Edge.Set(arrayLiteral: .leading, .trailing, .bottom, .top))
                        Text("Groups")
                            .modifier(HeaderViewModifier())
                            .padding(.bottom, -CGFloat.spacing.multiply(by: 2))
                        GroupSlider(model: self.model, groupViewWidth: self.groupViewWidth(width: parentView.size.width))
                        Divider()
                            .padding(Edge.Set(arrayLiteral: .leading, .trailing, .bottom, .top))
                        Text("Subjects")
                            .modifier(HeaderViewModifier())
                        ForEach(self.model.subjects, id: \.self) { (subject) in
                            SubjectView(subject: subject, width: parentView.size.width - CGFloat.spacing.multiply(by: 2))
                        }
                    }
                }
                .navigationBarTitle("Catalogue")
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationBarItems(trailing:
                    Button(action: {
                        self.searchButtonPressed()
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                    .accentColor(UIColor.systemYellow.color)
                    .font(.appSubheading)
                )

            }
        }
    }
    
    func searchButtonPressed() {
        
    }
}


struct CatalogueView_Previews: PreviewProvider {
    static var model: CatalogueModel = {
        var model = CatalogueModel()
        model.mockLoadGroups()
        return model
    }()
    
    static var previews: some View {
        CatalogueView(model: CatalogueModel())
    }
}
