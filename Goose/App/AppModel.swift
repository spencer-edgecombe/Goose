//
//  AppModel.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-10-29.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation

class AppModel {
    
    private static let firstRunKey = "is_first_run"
    
    static var shared: AppModel = {
        return AppModel()
    }()
    
    var isFirstRun: Bool = {
        let firstRunDefault = Default<Bool>(key: firstRunKey)
        if firstRunDefault.exists {
            return false
        } else {
            firstRunDefault.value = false
            return true
        }
    }()
    
}
