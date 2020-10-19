//
//  TestView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-08-29.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct ForEachTestView: View {
    var subjects: [Subject] {
        if let subjects = MockClient.subjects {
            return subjects
        }
        return []
    }
    var body: some View {
        ScrollView {
            VStack {
                ForEach(subjects, id: \.self) { subject in
                    SubjectRow(subject: subject)
                }
            }
        }
    }
}

struct ListTestView: View {
    var subjects: [Subject] {
        if let subjects = MockClient.subjects {
            return subjects
        }
        return []
    }
    var body: some View {
        List(subjects, id: \.self) { subject in
            SubjectRow(subject: subject)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        ForEachTestView()
    }
}

struct TestView_Previews2: PreviewProvider {
    static var previews: some View {
        ListTestView()
    }
}
