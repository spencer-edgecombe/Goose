//
//  CatalogViewModel.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-06-23.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

extension CatalogView {
    
    class ViewModel: ObservableObject {
        
        @Published private(set) var subjects: [Subject]  = []
        @Published private(set) var displayedFaculties: [Faculty] = []
        @State var isAlertPresented: Bool = true
        @Published var isFacultiesExpanded: Bool = false {
            didSet {
                setDisplayedFaculties()
            }
        }
        @Published private(set) var facultiesLoadingState: LoadingState = .loading
        @Published private(set) var subjectsLoadingState: LoadingState = .loading

        
        private var faculties: [Faculty] = []
        
        
        init(isMock: Bool = false) {
            guard !isMock else {
                if let faculties = MockClient.faculties {
                    self.facultiesLoadingState = .success
                    self.faculties = faculties
                }
                if let subjects = MockClient.subjects {
                    self.subjectsLoadingState = .success
                    self.subjects = subjects
                }
                sortFaculties()
                return
            }
            loadFaculties()
            loadSubjects()
        }
        
        func loadSubjects() {
            subjectsLoadingState = .loading
            Client.shared.subjects { [weak self] (subjects, error) in
                if let weakSelf = self {
                    if let error = error {
                        print(error)
                        weakSelf.subjectsLoadingState = .failure(message: "Goose could not load subjects")
                    } else {
                        weakSelf.subjectsLoadingState = .success
                        weakSelf.subjects = subjects
                    }
                }
            }
        }
        
        
        func loadFaculties() {
            facultiesLoadingState = .loading
            Client.shared.faculties { [weak self] (faculties, error) in
                if let weakSelf = self {
                    if let error = error {
                        print(error)
                        weakSelf.facultiesLoadingState = .failure(message: "Goose could not load faculties")
                        weakSelf.sortFaculties()
                        
                    } else {
                        weakSelf.faculties = faculties
                        weakSelf.facultiesLoadingState = .success
                        weakSelf.sortFaculties()
                    }
                }
            }
        }
        
        
        func filter(faculty: Faculty) -> [Subject] {
            return subjects.filter { (subject) -> Bool in
                return faculty.code == subject.faculty
            }
        }
        
        private func sortFaculties() {
            faculties.sort { (left, right) -> Bool in
                return left.isCoreFaculty && !right.isCoreFaculty
            }
            setDisplayedFaculties()
        }
        
        private func setDisplayedFaculties() {
            if isFacultiesExpanded {
                displayedFaculties = faculties
            } else {
                displayedFaculties = Array(faculties[0..<Faculty.coreFaculties.count])
            }
        }
        
    }
}

struct CatalogViewModel_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView(isMock: true)
    }
}
