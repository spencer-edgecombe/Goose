//
//  FacultyStack.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-09-25.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct FacultyStack: View {
    var gridItemWidth: CGFloat
    var isMock: Bool
    @ObservedObject var facultyListViewModel: FacultyListViewModel
    
    init(gridItemWidth width: CGFloat, _ isMock: Bool = false) {
        gridItemWidth = width
        facultyListViewModel = FacultyListViewModel(isMock)
    }
    
    var body: some View {
        HeaderView(title: .catalogMainFacultiesHeader)
        ResourceView(viewModel: self.facultyListViewModel, failurePlaceholderMessage: "Couldn't load faculties", failureAlertMessage: "Something went wrong") {
            LazyVGrid(columns: Array(repeating: GridItem( spacing: CGFloat.spacing, alignment: .top), count: 2)) {
                ForEach(self.facultyListViewModel.displayedFaculties, id: \.self) { faculty in
                    NavigationLink(destination:FacultyCatalogView(faculty: faculty, subjects: [])) {
                        FacultyView(faculty: faculty)
                            .frame(height: (gridItemWidth/2.0 - CGFloat.spacing*1.5)/CGFloat.phi.power(of: 0.5))
                    }
                }
            }
            .padding([.leading, .trailing])
            ExpandButton(title: self.facultyListViewModel.isFacultiesExpanded ? "See Less" : "See More") {
                self.facultyListViewModel.isFacultiesExpanded.toggle()
            }
        }
    }
    
    
}

struct FacultyStack_Previews: PreviewProvider {
    static var previews: some View {
        CatalogHome(true)
    }
}
