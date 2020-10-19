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
    
    init(_ isMock: Bool = false) {
        super.init(Client.shared.facultyURL(), isMock)
    }
    
    override func didFinishLoadingContent(isSuccess: Bool, content: Any) {
        super.didFinishLoadingContent(isSuccess: isSuccess, content: content)
        resources.sort { (left, right) -> Bool in
            return left.isCoreFaculty && !right.isCoreFaculty
        }
    }
    
}
