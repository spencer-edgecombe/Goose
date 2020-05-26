//
//  CourseView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-19.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct CourseView: View {
    
    func width(parentViewWidth width: CGFloat) -> CGFloat {
        return width - CGFloat.spacing.multiply(by: 2)
    }
    
    func height(parentViewWidth width: CGFloat) -> CGFloat {
        return self.width(parentViewWidth: width).divide(by: CGFloat.phi.power(of: 2.5))
    }
    
    var course: Course
    var groupColor: Color
    
    var body: some View {
        GeometryReader { parentView in
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.foreground)
                    .frame(width: self.width(parentViewWidth: parentView.size.width), height: self.height(parentViewWidth: parentView.size.width), alignment: .center)
                VStack(alignment: .leading) {
                    Text("\(self.course.subject) \(self.course.catalogueNumber)")
                        .padding(Edge.Set(arrayLiteral: .leading))
                        .foregroundColor(self.groupColor)
                        .font(.appSubheading)
                        .frame(minWidth: self.width(parentViewWidth: parentView.size.width).half - .spacing, alignment: .leading)

                    Text(self.course.title)
                        .font(.appSubheading)
                        .padding(Edge.Set(arrayLiteral: .leading, .trailing))
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.appLabel)
                }
            }
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(course: Course(courseId: "#79980", subject: "CS", catalogueNumber: "246", title: "Object Oriented Software Development", units: 0.5, description: "Introduction to object-oriented programming and to tools and techniques for software development. Designing, coding, debugging, testing, and documenting medium-sized programs: reading specifications and designing software to implement them; selecting appropriate data structures and control structures; writing reusable code; reusing existing code; basic performance issues; debuggers; test suites.", academicLevel: "Undergraduate"), groupColor: UIColor.systemPink.color)
    }
}
