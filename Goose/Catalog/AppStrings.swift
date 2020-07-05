//
//  AppStrings.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-03-20.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import UIKit

class AppStrings {
    static let catalogTabTitle = NSLocalizedString("catalog_tab_title", comment: "")
    static let catalogTabSymbol = NSLocalizedString("catalog_tab_symbol", comment: "")
    
    static let myClassesTabTitle = NSLocalizedString("my_classes_tab_title", comment: "")
    static let myClassesTabSymbol = NSLocalizedString("my_classes_tab_symbol", comment: "")
    
    static let scheduleTabTitle = NSLocalizedString("schedule_tab_title", comment: "")
    static let scheduleTabSymbol = NSLocalizedString("schedule_tab_symbol", comment: "")
}

extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
    
    func widthWithConstrainedHeight(height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.width
    }
}
