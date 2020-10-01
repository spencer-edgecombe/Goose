//
//  CatalogView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-14.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct CatalogView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    
    @State var isLoadingErrorPresented: Bool = false
    
    init(isMock: Bool = false) {
        viewModel = ViewModel(isMock: isMock)
    }
    
    var successView: some View {
        GeometryReader { parent in
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Group {
                        PaddedDivider()
                        HeaderView(title: .catalogMainFacultiesHeader)
                        LazyVGrid(columns: Array(repeating: GridItem( spacing: CGFloat.spacing, alignment: .top), count: 2)) {
                            ForEach(self.viewModel.displayedFaculties, id: \.self) { faculty in
                                NavigationLink(destination:FacultyCatalogView(faculty: faculty, subjects: viewModel.filter(faculty: faculty))) {
                                    FacultyView(faculty: faculty)
                                        .frame(height: (parent.size.width/2.0 - CGFloat.spacing*1.5)/CGFloat.phi.power(of: 0.5))
                                }
                            }
                        }
                        .padding([.leading, .trailing])
                        ExpandButton(title: self.viewModel.isFacultiesExpanded ? "See Less" : "See More") {
                            self.viewModel.isFacultiesExpanded.toggle()
                            
                        }
                    }
                    Group {
                        HeaderView(title: .catalogMainSubjectsHeader)
                            .topPadding()
                        VStack(alignment: .leading, spacing: .spacing) {
                            ForEach(self.viewModel.subjects, id: \.self) { subject in
                                NavigationLink(destination:SubjectCatalogView(subject: subject)) {
                                    SubjectRow(subject: subject)
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    var failureView: some View {
        Group {
            NoContentPlaceholder(message: "Couldn't load")
                .alert(isPresented: viewModel.$isAlertPresented, content: {
                    Alert(title: Text("Oops")
                          , message: Text("There was a problem!")
                          , dismissButton: .default(Text("Okay")))
                })
            CenterButton(title: "Reload") {
                viewModel.loadSubjects()
                viewModel.loadFaculties()
            }
        }
    }
    
    var loadingView: some View {
        Group {
            LoadingPlaceholder()
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if case .success = viewModel.facultiesLoadingState, case .success = viewModel.subjectsLoadingState {
                    successView
                } else if case .failure = viewModel.facultiesLoadingState, case .failure = viewModel.subjectsLoadingState {
                    failureView
                } else {
                    loadingView
                }
            }
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
            .navigationBarTitle("Catalog")
        }
        
    }
}


struct CatalogView_Previews: PreviewProvider {
    
    static var previews: some View {
        CatalogView(isMock: true)
    }
}
