//
//  GroupCatalogViewModel.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-06-27.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

extension GroupCatalogView {
    
    class ViewModel: ObservableObject {
        
        @Published private(set) var subjects: [Subject]
        @Published private(set) var group: Group

        var groupCode: String {
            return group.code.rawValue
        }
        
        var groupName: String {
            return group.name
        }

        var groupColor: UIColor {
            return group.color
        }
        
        init(group: Group, subjects: [Subject]) {
            self.subjects = subjects
            self.group = group
        }
        
    }
}
