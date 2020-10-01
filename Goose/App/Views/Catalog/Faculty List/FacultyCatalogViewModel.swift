//
//  FacultyCatalogViewModel.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-06-27.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

extension FacultyCatalogView {
    
    class ViewModel: ObservableObject {
        
        @Published private(set) var subjects: [Subject]
        @Published private(set) var faculty: Faculty

        var facultyCode: String {
            return faculty.code.rawValue
        }
        
        var facultyName: String {
            return faculty.name
        }

        var color: Color {
            return faculty.color
        }
        
        init(faculty: Faculty, subjects: [Subject]) {
            self.subjects = subjects
            self.faculty = faculty
        }
        
    }
}
