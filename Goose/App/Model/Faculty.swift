//
//  Faculty.swift
//  UWCourses
//
//  Created by Spencer Edgecombe on 2020-04-21.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

enum FacultyCode: String, Codable, Hashable {
    case AHS, ART, CGC, ENG, ENV, GRAD, IS, MAT, REN, SCI, STJ, STP, THL, VPA, NONE
}

struct Faculty: Resource {
    
    let id = UUID()
    let code: FacultyCode
    let name: String
    
    var color: Color {
        return Faculty.color(faculty: code)
    }
    
    var isCoreFaculty: Bool {
        if let isCore = Faculty.coreFaculties[code] {
            return isCore
        }
        return false
    }
    
    enum CodingKeys: String, CodingKey {
        case code = "group_code"
        case name = "group_short_name"
    }
    
    static let coreFaculties: [FacultyCode: Bool] =
        [.AHS: true,
         .ART: true,
         .ENG: true,
         .ENV: true,
         .MAT: true,
         .SCI: true]

    private static let defaultFacultyColor: Color = UIColor.systemRed.color
    private static let defaultFacultyIconName: String = "globe"

    typealias ColorAndSystemName = (color: Color, iconName: String)
    
    static let colorsAndIconNames: [FacultyCode: ColorAndSystemName] =
        [
            .ART: (UIColor.systemOrange.color, "paintbrush"),
            .SCI: (UIColor.systemIndigo.color, "burn"),
            .AHS: (UIColor.systemTeal.color, "staroflife"),
            .MAT: (UIColor.systemPink.color, "x.squareroot"),
            .ENG: (UIColor.systemPurple.color, "gear"),
            .ENV: (UIColor.systemGreen.color, "leaf"),
            .STJ: (UIColor.systemYellow.color, "person.3"),
            .STP: (UIColor.systemGreen.color, "globe"),
            .CGC: (defaultFacultyColor, "flag"),
            .REN: (UIColor.systemGreen.color, "books.vertical"),
            .IS: (UIColor.systemTeal.color, "person"),
            .THL: (UIColor.systemIndigo.color, "book.closed"),
            .GRAD: (defaultFacultyColor, "graduationcap"),
            .VPA: (UIColor.systemBlue.color, "camera.filters"),
        ]
    
    
    static func color(faculty: FacultyCode) -> Color {
        guard let facultyColor: Color = colorsAndIconNames[faculty]?.color else {
            return defaultFacultyColor
        }
        return facultyColor
    }
    
    static func iconName(faculty: FacultyCode) -> String {
        guard let facultyIconName: String = colorsAndIconNames[faculty]?.iconName else {
            return defaultFacultyIconName
        }
        return facultyIconName
    }
    
}
