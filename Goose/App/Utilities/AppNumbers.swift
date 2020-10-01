//
//  AppNumbers.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-14.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import UIKit

extension CGFloat {
        
    static let phi: CGFloat = (1 + sqrt(5)) / 2
   
    static let spacing: CGFloat = 16
    
    static let halfSpacing: CGFloat = spacing.half
    
    var half: CGFloat {
        return self / 2.0
    }
    
    var inverse: CGFloat {
        return 1 / self
    }
    
    func multiply(by factor: CGFloat) -> CGFloat {
        return self * factor
    }
    
    func divide(by factor: CGFloat) -> CGFloat {
        return self / factor
    }
    
    func power(of exponent: CGFloat) -> CGFloat {
        return pow(self, exponent)
    }
    
    static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
}
