//
//  Group.swift
//  UWCourses
//
//  Created by Spencer Edgecombe on 2020-04-21.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import UIKit

enum GroupCode : String, Codable {
    case AHS, ART, CGC, ENG, ENV, GRAD, IS, MAT, REN, SCI, STJ, STP, THL, VPA
    
}

func groupColor(group: GroupCode) -> UIColor {
    switch group {
    case .ART:
        return UIColor.systemOrange
    case .SCI:
        return UIColor.systemIndigo
    case .AHS:
        return UIColor.systemTeal
    case .MAT:
        return UIColor.systemPink
    case .ENG:
        return UIColor.systemPurple
    case .ENV:
        return UIColor.systemGreen
    case .STJ:
        return UIColor.systemRed
    case .STP:
        return UIColor.systemRed
    case .CGC:
        return UIColor.systemRed
    case .REN:
        return UIColor.systemRed
    default:
        return UIColor.systemYellow
    }
}

func groupIconName(group: GroupCode) -> String {
    switch group {
    case .ART:
        return "paintbrush"
    case .SCI:
        return "burn"
    case .AHS:
        return "staroflife"
    case .MAT:
        return "x.squareroot"
    case .ENG:
        return "gear"
    case .ENV:
        return "arrow.3.trianglepath"
    case .STJ:
        return "house"
    case .STP:
        return "house"
    case .CGC:
        return "house"
    case .REN:
        return "house"
    default:
        return "globe"
    }
}

struct Group : Codable, Identifiable, Hashable {
    let id = UUID()
    let code:GroupCode
    let name:String
    
    var color: UIColor {
        return Goose.groupColor(group: code)
    }
    
    enum CodingKeys: String, CodingKey {
        case code = "group_code"
        case name = "group_short_name"
    }
    
    
    
}
