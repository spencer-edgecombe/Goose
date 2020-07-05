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
        @Published private(set) var groups: [Group] = []
        @Published private(set) var subjectsLoadingState: LoadingState = .loading
        @Published private(set) var groupsLoadingState: LoadingState = .loading

        init() {
            loadGroups()
            loadSubjects()
        }
        
        func loadSubjects() {
            Client.shared.subjects { [weak self] (subjects, error) in
                if let weakSelf = self {
                    if let error = error {
                        print(error)
                        weakSelf.subjectsLoadingState = .failure(message: "Goose could not load subjects")
                    } else {
                        weakSelf.subjects = subjects
                        weakSelf.subjectsLoadingState = .success
                    }
                }
            }
        }
        
        func loadGroups() {
            Client.shared.groups { [weak self] (groups, error) in
                if let weakSelf = self {
                    if let error = error {
                        print(error)
                        weakSelf.groupsLoadingState = .failure(message: "Goose could not load groups")
                    } else {
                        weakSelf.groups = groups
                        weakSelf.groupsLoadingState = .success
                    }
                }
            }
        }
        
        func filter(group: Group) -> [Subject] {
            return subjects.filter { (subject) -> Bool in
                return group.code == subject.group
            }
        }
        
    }
}
