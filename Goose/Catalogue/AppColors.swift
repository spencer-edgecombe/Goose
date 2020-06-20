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
        return UIColor.init { (trait) -> UIColor in
            return trait.userInterfaceStyle == .light ? .white : .black
        }
    }
    
    static var appBarBackground: UIColor {
        return UIColor.init { (trait) -> UIColor in
            return trait.userInterfaceStyle == .light ? .white : .black
            }.withAlphaComponent(0.5)
    }
    
    static var appForeground: UIColor {
        return UIColor.init { (trait) -> UIColor in
            return trait.userInterfaceStyle == .light ? #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1) : #colorLiteral(red: 0.1725490196, green: 0.1725490196, blue: 0.1803921569, alpha: 1)
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
