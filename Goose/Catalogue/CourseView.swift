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
        return self.width(parentViewWidth: width).divide(by: CGFloat.phi.power(of: 3))
    }
    
    var parentViewWidth: CGFloat
    var course: Course
    var groupColor: Color
    
    var body: some View {
            VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.foreground)
                            .frame(width: width(parentViewWidth: parentViewWidth), height: height(parentViewWidth: parentViewWidth), alignment: .center)
                           .modifier(ShadowModifier())
                    HStack {
                            Text(course.shorthand)
                                .font(.appSubheading)
                                .frame(maxWidth: width(parentViewWidth: parentViewWidth).divide(by: 3), alignment: .leading)
                                .padding(.leading, CGFloat.spacing.multiply(by: 2))
                                .foregroundColor(groupColor)
                            Text(course.title)
                                .font(.appLabel)
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.trailing)
                                .frame(maxWidth: width(parentViewWidth: parentViewWidth).multiply(by: 2/3), alignment: .trailing)
                                .padding(.trailing, CGFloat.spacing.multiply(by: 2))
                                .foregroundColor(.primary)

                        }
                    }
                    Spacer(minLength: .spacing)
                }
            }
    
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(parentViewWidth: 375, course: Course(courseId: "#79980", subject: "CS", catalogueNumber: "246", title: "Object Oriented Software Development", units: 0.5, description: "Introduction to object-oriented programming and to tools and techniques for software development. Designing, coding, debugging, testing, and documenting medium-sized programs: reading specifications and designing software to implement them; selecting appropriate data structures and control structures; writing reusable code; reusing existing code; basic performance issues; debuggers; test suites.", academicLevel: "Undergraduate"), groupColor: UIColor.systemPink.color)
    }
}
