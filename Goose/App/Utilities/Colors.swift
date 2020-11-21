//
//  AppColors.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-03-18.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

extension UIColor {
    static var appBackground: UIColor {
        return .systemGroupedBackground
    }
    
    static var appBarBackground: UIColor {
        return .systemGroupedBackground
    }
    
    static var appForeground: UIColor {
        return UIColor.init { (trait) -> UIColor in
            return .secondarySystemGroupedBackground
        }
    }
    
    var color: Color {
        return Color(self)
    }
}

extension SwiftUI.Color {
    
    static var background: Color {
        let color = Color(.appBackground)
        return color
    }
    
    static var foreground: Color {
        let color = Color(.appForeground)
        return color
    }
    
}
