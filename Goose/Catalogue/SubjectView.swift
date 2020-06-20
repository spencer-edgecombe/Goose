//
//  SubjectView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-19.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct SubjectView: View {
    var subject: Subject
    var width: CGFloat
    var height: CGFloat {
        return width.divide(by: CGFloat.phi.power(of: 3))
    }
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.foreground)
                    .frame(width: width, height: height, alignment: .center)
                   .modifier(ShadowModifier())
            HStack {
                    Text(subject.name)
                        .font(.appSubheading)
                        .frame(maxWidth: width.divide(by: 3), alignment: .leading)
                        .padding(.leading, CGFloat.spacing.multiply(by: 2))
                        .foregroundColor(Color(Goose.groupColor(group: subject.group)))
                    Text(subject.description)
                        .font(.appLabel)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.trailing)
                        .frame(maxWidth: width.multiply(by: 2/3), alignment: .trailing)
                        .padding(.trailing, CGFloat.spacing.multiply(by: 2))
                        .foregroundColor(.primary)

                }
            }
            Spacer(minLength: .spacing)
        }
    }
}

struct SubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView(subject: Subject(name: "CS", description: "Computer Science", group: .MAT), width: 343)
    }
}
