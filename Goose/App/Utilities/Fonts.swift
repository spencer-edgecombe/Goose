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
        return largeTitle * CGFloat.phi.power(of: 3)
    }

    static var xxLarge: CGFloat {
        return largeTitle * CGFloat.phi.power(of: 2)
    }

    static var xLarge: CGFloat {
        return largeTitle * .phi
    }

    static var large: CGFloat {
        return largeTitle * CGFloat.phi.power(of: 0.5)
    }

    static var largeTitle: CGFloat {
        return UIFont.preferredFont(forTextStyle: .largeTitle).pointSize
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

    static var small: CGFloat {
        return largeTitle / CGFloat.phi.power(of: 2.5)
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

    static func regularRounded(withSize size: CGFloat) -> UIFont {
        if let descriptor = UIFont.systemFont(ofSize: size, weight: .regular).fontDescriptor.withDesign(.rounded)  {
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
        return heavyRounded(withSize: FontSize.label)
    }

    static var appBody: UIFont {
        return regularRounded(withSize: FontSize.body)
    }

    static var appSmall: UIFont {
        return heavyRounded(withSize: FontSize.small)
    }

}

extension Font {

    static func heavyRounded(withSize size: CGFloat) -> Font {
        return Font.system(size: size, weight: .heavy, design: .rounded)
    }

    static func semiboldRounded(withSize size: CGFloat) -> Font {
        return Font.system(size: size, weight: .semibold, design: .rounded)
    }

    static func regularRounded(withSize size: CGFloat) -> Font {
        return Font.system(size: size, weight: .regular, design: .rounded)
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
        return heavyRounded(withSize: FontSize.label)
    }

    static var appBody: Font {
        return regularRounded(withSize: FontSize.body)
    }

    static var appSmall: Font {
        return heavyRounded(withSize: FontSize.small)
    }

    static var boldWeight: Font.Weight {
        return .heavy
    }

    static var regularWeight: Font.Weight {
        return .medium
    }


}
extension Font {
    static func round(style: Font.TextStyle, weight: Font.Weight? = nil) -> Font {
        guard let weight = weight else {
            return .system(style, design: .rounded)
        }
        return Font.system(style, design: .rounded).weight(weight)
    }
}
