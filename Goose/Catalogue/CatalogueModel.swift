//
//  CatalogueModel.swift
//  UWCourses
//
//  Created by Spencer Edgecombe on 2020-03-26.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation


class CatalogueModel {
    var subjects: [Subject]
    var groups: [Group]

    init() {
        subjects = []
        groups = []
        mockLoadGroups()
        mockLoadSubjects()
    }
    
    func loadSubjects(completionHandler: @escaping ([Subject]) -> ()) {
        Client.shared.subjects { [weak self] (subjects, error) in
            if let weakSelf = self {
                if let error = error {
                    print(error)
                } else {
                    weakSelf.subjects = subjects
                }
            }
            DispatchQueue.main.async {
                completionHandler(subjects)
            }
        }
    }
    
    func loadGroups(completionHandler: @escaping ([Group]) -> ()) {
        Client.shared.groups { [weak self] (groups, error) in
            if let weakSelf = self {
                if let error = error {
                    print(error)
                } else {
                    weakSelf.groups = groups
                }
            }
            DispatchQueue.main.async {
                completionHandler(groups)
            }
        }
    }
    
    func mockLoadGroups() {
        if let groups = MockClient.groups() {
            self.groups = groups
        }
    }
    
    func mockLoadSubjects() {
        if let subjects = MockClient.subjects() {
            self.subjects = subjects
        }
    }
    
    func filter(group: Group) -> [Subject] {
        return subjects.filter { (subject) -> Bool in
            return group.code == subject.group
        }
    }
    
    func subject(at row: Int) -> Subject {
        return subjects[row]
    }
    
    func group(at row: Int) -> Group {
        return groups[row]
    }

    func numberOfSubjects() -> Int {
        return subjects.count
    }
    
    func numberOfGroups() -> Int {
        return groups.count
    }
    
}
