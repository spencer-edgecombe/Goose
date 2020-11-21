//
//  Default.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-11-21.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation

class Default<T> {
    
    private var key: String
    
    var value: T? {
        get {
            return UserDefaults.standard.value(forKey: key) as? T
        } set {
            UserDefaults.standard.setValue(newValue, forKey: key)
        }
    }
    
    var exists: Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    init(key: String, value: T? = nil) {
        self.key = key
        guard let value = value else {
            return
        }
        self.value = value
    }
}
