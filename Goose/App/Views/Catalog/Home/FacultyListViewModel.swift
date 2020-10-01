//
//  FacultyListViewModel.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-10-01.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

class FacultyListViewModel: ListViewModel<Faculty> {
    @Published private(set) var displayedFaculties: [Faculty] = []
    @State var isFacultiesExpanded: Bool = false {
        didSet {
            setDisplayedFaculties()
            objectWillChange.send()
        }
    }
    init(_ isMock: Bool = false) {
        super.init(Client.shared.facultyURL(), isMock)
    }
    
    override func didFinishLoadingContent(isSuccess: Bool, content: Any) {
        super.didFinishLoadingContent(isSuccess: isSuccess, content: content)
        sortFaculties()
    }
    
    private func sortFaculties() {
        resources.sort { (left, right) -> Bool in
            return left.isCoreFaculty && !right.isCoreFaculty
        }
        setDisplayedFaculties()
    }
    
    private func setDisplayedFaculties() {
        if isFacultiesExpanded {
            displayedFaculties = resources
        } else {
            displayedFaculties = Array(resources[0..<Faculty.coreFaculties.count])
        }
        objectWillChange.send()
    }
}
