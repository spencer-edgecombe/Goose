//
//  CatalogView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-14.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct CatalogView: View {
    
    @ObservedObject var viewModel: ViewModel = ViewModel()

    func groupViewWidth(width: CGFloat) -> CGFloat {
        return width.advanced(by: -CGFloat.spacing.multiply(by: 2)).divide(by: CGFloat.phi)
    }
    
    func subjectViewWidth(parentViewWidth width: CGFloat) -> CGFloat {
        return width - CGFloat.spacing.multiply(by: 2)
    }
    
    func subjectViewHeight(parentViewWidth width: CGFloat) -> CGFloat {
        return subjectViewWidth(parentViewWidth: width).divide(by: CGFloat.phi.power(of: 3))
    }
    
    func groupViewHeight(width: CGFloat) -> CGFloat {
        return groupViewWidth(width: width).divide(by: CGFloat.phi.power(of: 0.5))
    }
    
    @State var isLoadingErrorPresented: Bool = false
    
    
    
//    var groupSlider: some View {
//        switch (viewModel.groupsLoadingState) {
//        case .loading:
//            var loadingView: some View {
//                Text("Loading")
//            }
//            return loadingView
//        case .success:
//            var groupSliderView: some View {
//                GeometryReader {
//                    parentView in
//
//               }
//            }
//            return groupSliderView
//        case .failure(let message):
//            var errorMessage: some View {
//                alert(isPresented: $isLoadingErrorPresented) { () -> Alert in
//                    Alert(title: Text("Error"), message: Text(message))
//                }
//            }
//            return errorMessage
//        }
//        var empty: some View {
//            Text("")
//        }
//        return empty
//    }
    
    var body: some View {
            NavigationView {
                GeometryReader {
                parentView in
                    ScrollView(showsIndicators: false) {
                        VStack{
                            Divider()
                                .padding(Edge.Set(arrayLiteral: .leading, .trailing, .bottom, .top))
                            Text("Groups")
                                .modifier(HeaderViewModifier())
                                .padding(.bottom, -CGFloat.spacing.multiply(by: 2))
                            ScrollView(.horizontal, showsIndicators: false) {
                                VStack {
                                   Spacer(minLength: 2*CGFloat.spacing)
                                   HStack {
                                    ForEach(self.viewModel.groups, id: \.self) {
                                           group in
                                           HStack{
                                               Spacer(minLength: CGFloat.spacing)
                                                NavigationLink(destination: GroupCatalogView(group: group, subjects: self.viewModel.filter(group: group))) {
                                                    GroupView(group: group, groupViewWidth: self.groupViewWidth(width: parentView.size.width))
                                               }
                                           }
                                       }
                                   }
                                   .frame(minHeight: self.groupViewHeight(width: parentView.size.width))
                                   .padding(.bottom, .spacing)
                               }
                            }
                            
                            Divider()
                                .padding(Edge.Set(arrayLiteral: .leading, .trailing, .bottom, .top))
                            Text("Subjects")
                                .modifier(HeaderViewModifier())
                            ForEach(self.viewModel.subjects, id: \.self) { (subject) in
                                NavigationLink(destination:SubjectCatalogView(subjectModel: SubjectModel(subject: subject))) {
                                    SubjectView(subject: subject, width: parentView.size.width - CGFloat.spacing.multiply(by: 2))
                                }
                            }
                        }
                    }
                    .navigationBarTitle("Catalog")
                    .navigationViewStyle(StackNavigationViewStyle())
            }
        }
    }
    
    func searchButtonPressed() {
        
    }
}


struct CatalogView_Previews: PreviewProvider {
    
    static var previews: some View {
        CatalogView()
    }
}
