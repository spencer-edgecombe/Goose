//
//  GoldenRatio.swift
//  UWCourses
//
//  Created by Spencer Edgecombe on 2020-04-24.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import UIKit

class GoldenRatio {
    
    private static let φ = (1 + 5.squareRoot()) / 2
    
    private static var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    static func divide(number: CGFloat, by factor: Double) -> CGFloat {
        return number / CGFloat(pow(φ, factor))
    }
    
    static func inverseDivide(number: CGFloat, by factor: Double) -> CGFloat {
        return number * (1 - (1 / CGFloat(pow(φ, factor))))
    }
    
    static func multiply(number: CGFloat, by factor: Double) -> CGFloat {
        return number * CGFloat(pow(φ, factor))
    }
    
    static func portionOfScreen(factor: Double) -> CGFloat {
        return GoldenRatio.divide(number: GoldenRatio.screenHeight, by: factor)
    }
    
    static func inversePortionOfScreen(factor: Double) -> CGFloat {
            return GoldenRatio.inverseDivide(number: GoldenRatio.screenHeight, by: factor)
    }
    
}
