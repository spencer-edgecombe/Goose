//
//  StateObject.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-06-14.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

struct StateObject<T: Any> {
    var isEnabled: Bool {
        didSet {
            value = property(isEnabled)
        }
    }
    var property: (Bool) -> T
    var value: T
    init(initialValue isEnabled: Bool = false, property: @escaping (Bool) -> T) {
        self.property = property
        self.isEnabled = isEnabled
        self.value = property(isEnabled)
    }
    
    mutating func toggle() {
        self = StateObject<T>(initialValue: !isEnabled, property: property)
    }
}
