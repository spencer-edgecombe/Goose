//
//  CourseView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-19.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct CourseView: View {
    
    var course: Course
    
    var body: some View {
        CardView(title: course.title, titleColor: course.facultyColor, isLink: true) {
            VStack(alignment: .leading) {
                Text(course.shorthand)
                    .headingFont()
                    .multilineTextAlignment(.leading)
                Text(course.description)
                    .bodyFont(isBold: false)
                    .lineLimit(3)
                HStack(alignment: VerticalAlignment.firstTextBaseline) {
                    Text(course.unitsText)
                        .headingFont()
                        .multilineTextAlignment(.leading)
                        .padding([.top], .halfSpacing)
                    Text("Units")
                        .labelFont(isBold: false, color: .secondary)
                        .multilineTextAlignment(.leading)
                        .padding([.top], .halfSpacing)
                    Spacer()
                    Text(course.academicLevel.capitalized)
                        .autocapitalization(.words)
                        .labelFont(isBold: false)
                }
            }
        }
            
    }
    
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CourseListView(subject: Subject(name: "CS", description: "Computer Science", faculty: FacultyCode.MAT), true)
        }
    }
}
