//
//  AppFonts.swift
//  UWCourses
//
//  Created by Spencer Edgecombe on 2020-03-22.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct FontSize {
    
    static var xxxLarge: CGFloat {
        return largeTitle * CGFloat.phi.power(of: 2)
    }
    
    static var xxLarge: CGFloat {
        return largeTitle * CGFloat.phi.power(of: 1.5)
    }
    
    static var xLarge: CGFloat {
        return largeTitle * .phi
    }
    
    static var large: CGFloat {
        return largeTitle * CGFloat.phi.power(of: 0.5)
    }
    
    static var largeTitle: CGFloat {
        return 34
    }
    
    static var heading: CGFloat {
        return largeTitle / CGFloat.phi.power(of: 0.5)
    }
    
    static var subheading: CGFloat {
        return largeTitle / .phi
    }
    
    static var label: CGFloat {
        return largeTitle / CGFloat.phi.power(of: 1.5)
    }
    
    static var body: CGFloat {
        return largeTitle / CGFloat.phi.power(of: 2)
    }
}

extension UIFont {
    
    
    
    static func heavyRounded(withSize size: CGFloat) -> UIFont {
        if let descriptor = UIFont.systemFont(ofSize: size, weight: .heavy).fontDescriptor.withDesign(.rounded)  {
            return UIFont(descriptor: descriptor, size: size)
        }
        return UIFont.systemFont(ofSize: size)
    }
    
    static func semiboldRounded(withSize size: CGFloat) -> UIFont {
        if let descriptor = UIFont.systemFont(ofSize: size, weight: .semibold).fontDescriptor.withDesign(.rounded)  {
            return UIFont(descriptor: descriptor, size: size)
        }
        return UIFont.systemFont(ofSize: size)
    }
    
    static var appXXXLarge: UIFont {
        return heavyRounded(withSize: FontSize.xxxLarge)
    }
    
    static var appXXLarge: UIFont {
        return heavyRounded(withSize: FontSize.xxLarge)
    }
    
    static var appXLarge: UIFont {
        return heavyRounded(withSize: FontSize.xLarge)
    }
    
    static var appLarge: UIFont {
        return heavyRounded(withSize: FontSize.large)
    }
    
    static var appLargeTitle: UIFont {
        return heavyRounded(withSize: FontSize.largeTitle)
    }
    
    static var appHeading: UIFont {
        return heavyRounded(withSize: FontSize.heading)
    }
    
    static var appSubheading: UIFont {
        return heavyRounded(withSize: FontSize.subheading)
    }
    
    static var appLabel: UIFont {
        return semiboldRounded(withSize: FontSize.label)
    }
    
    static var appBody: UIFont {
        return semiboldRounded(withSize: FontSize.body)
    }
    
}

extension Font {
    
    static func heavyRounded(withSize size: CGFloat) -> Font {
        return Font.system(size: size, weight: .heavy, design: .rounded)
    }
    
    static func semiboldRounded(withSize size: CGFloat) -> Font {
        return Font.system(size: size, weight: .semibold, design: .rounded)
    }
    
    static var appXXXLarge: Font {
        return heavyRounded(withSize: FontSize.xxxLarge)
    }
    
    static var appXXLarge: Font {
        return heavyRounded(withSize: FontSize.xxLarge)
    }
    
    static var appXLarge: Font {
        return heavyRounded(withSize: FontSize.xLarge)
    }
    
    static var appLarge: Font {
        return heavyRounded(withSize: FontSize.large)
    }
    
    static var appLargeTitle: Font {
        return heavyRounded(withSize: FontSize.largeTitle)
    }
    
    static var appHeading: Font {
        return heavyRounded(withSize: FontSize.heading)
    }
    
    static var appSubheading: Font {
        return heavyRounded(withSize: FontSize.subheading)
    }
    
    static var appLabel: Font {
        return semiboldRounded(withSize: FontSize.label)
    }
    
    static var appBody: Font {
        return semiboldRounded(withSize: FontSize.body)
    }
    
}
