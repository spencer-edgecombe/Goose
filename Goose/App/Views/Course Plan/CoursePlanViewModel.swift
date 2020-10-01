//
//  CoursePlanViewModel.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-10-01.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

class CoursePlanViewModel: ObservableObject {
    
    @Published var savedCourses: [Course] = []
    
    private var isMock: Bool
    
    init(_ isMock: Bool = false) {
        self.isMock = true
    }
    
    func loadCourses() {
        guard !isMock else {
            savedCourses = MockClient.load(resourceType: [Course].self)
            return
        }
        savedCourses = UserData.shared.savedCourses
    }
}
