//
//  FacultyIcons.swift
//  Pods
//
//  Created by Spencer Edgecombe on 2020-09-02.
//

import SwiftUI



struct FacultyIcon: View {
    private let radius = CGFloat.spacing.multiply(by: 2.5)
    
    static let icons: [FacultyCode: FacultyIcon] = {
        var result: [FacultyCode: FacultyIcon] = [:]
        Faculty.colorsAndIconNames.keys.forEach { (facultyCode) in
            result[facultyCode] = FacultyIcon(facultyCode: facultyCode)
        }
        return result
    }()
    
    var facultyCode: FacultyCode
    
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .fill(Faculty.color(faculty: facultyCode))
                .frame(width: radius, height: radius, alignment: .center)
            Image(systemName: Faculty.iconName(faculty: facultyCode))
                .labelFont(color: .white)
        }
    }
    
}

struct FacultyIcons_Previews: PreviewProvider {
    static var previews: some View {
        FacultyIcon.icons[.ART]
    }
}
