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
    
    init(subject: Subject) {
        self.subject = subject
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: .spacing) {
            VStack(alignment: .leading) {
                Text(subject.name)
                    .labelFont()
                Text(subject.description)
                    .multilineTextAlignment(.leading)
                    .bodyFont(color: Faculty.color(faculty: subject.faculty))
            }
        }
        .padding()
    }
}

struct SubjectRow_Previews: PreviewProvider {
    static var previews: some View {
        SubjectListView(faculty: Faculty(code: .MAT, name: "Math"), true)
    }
}
