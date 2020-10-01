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
   
}

extension String {
    
    static func localized(key: String, comment: String = "") -> String {
        return NSLocalizedString(key, comment: comment)
    }
    
    static var catalogTitle: String {
        return localized(key: "catalog_title")
    }
    
    static var catalogMainFacultiesHeader: String {
        return localized(key: "catalog_main_faculties_header")
    }
    
    static var catalogMainSubjectsHeader: String {
        return localized(key: "catalog_main_subjects_header")
    }

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
