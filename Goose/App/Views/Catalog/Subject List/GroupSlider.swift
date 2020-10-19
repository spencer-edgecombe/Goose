//
//  FacultySlider.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-15.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct FacultySlider: View {
    
    var model: CatalogModel
    
    var facultyViewWidth: CGFloat
    
    var facultyViewHeight: CGFloat {
        return facultyViewWidth.divide(by: CGFloat.phi.power(of: 0.5))
    }
    
    @State var faculties = [Faculty]()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Spacer(minLength: 2*CGFloat.spacing)
                HStack {
                    ForEach(faculties, id: \.self) {
                        faculty in
                        HStack{
                            Spacer(minLength: CGFloat.spacing)
                            NavigationLink(destination: FacultyCatalogView(faculty: faculty, subjects: self.model.filter(faculty: faculty))) {
                                FacultyView(faculty: faculty, facultyViewWidth: self.facultyViewWidth)
                            }
                        }
                    }
                }
                .frame(minHeight: facultyViewHeight)
                .padding(.bottom, .spacing)
            }
        }
    .onAppear(perform: loadData)
    }
    
    func loadData() {
        model.loadFaculties { faculties in
            self.faculties = faculties
        }
    }
}

struct FacultySlider_Previews: PreviewProvider {
    static var model: CatalogModel {
        let model = CatalogModel()
        model.mockLoadFaculties()
        return model
    }
    static var previews: some View {
        FacultySlider(model: model, facultyViewWidth: CGFloat(343).divide(by: CGFloat.phi.power(of: 2)))
    }
}
