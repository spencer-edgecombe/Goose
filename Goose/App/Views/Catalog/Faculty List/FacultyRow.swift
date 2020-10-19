//
//  FacultyRow.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-10-19.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct FacultyRow: View {
    @State var faculty: Faculty
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center, spacing: .spacing) {
                FacultyIcon.icons[faculty.code]
                Text(faculty.name)
                    .labelFont()
            }
        }
        .verticalPadding()
    }
}

struct FacultyRow_Previews: PreviewProvider {
    static var previews: some View {
        FacultyRow(faculty: Faculty(code: .MAT, name: "Math"))
    }
}
