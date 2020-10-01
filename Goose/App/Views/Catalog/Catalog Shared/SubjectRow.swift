//
//  SubjectRow.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-19.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct SubjectRow: View {
    var subject: Subject
    var isIconShowing: Bool
    
    init(subject: Subject, _ isIconShowing: Bool = true) {
        self.subject = subject
        self.isIconShowing = isIconShowing
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
                .padding(.leading)
            HStack(alignment: .center, spacing: .spacing) {
                if isIconShowing {
                    FacultyIcon.icons[subject.faculty]
                }
                VStack(alignment: .leading) {
                    Text(subject.name)
                        .labelFont()
                    Text(subject.description)
                        .multilineTextAlignment(.leading)
                        .bodyFont(isBold: false, color: isIconShowing ? .secondary : Faculty.color(faculty: subject.faculty))
                    
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .labelFont(isBold: false, color: .secondary)
            }
            .padding()
        }
    }
}

struct SubjectRow_Previews: PreviewProvider {
    static var previews: some View {
        CatalogHome(true)
    }
}
