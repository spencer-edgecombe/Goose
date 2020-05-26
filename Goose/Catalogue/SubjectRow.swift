//
//  SubjectRow.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-03-18.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct SubjectRow: View {
    
    let buttonSpacing: CGFloat = 20.0
    
    var firstSubject:Subject
    var secondSubject:Subject?
    var thirdSubject:Subject?
    
    
    var body: some View {
        HStack(alignment: .center, spacing: buttonSpacing) {
            SubjectButton(subject: firstSubject)
            SubjectButton(subject: secondSubject)
            SubjectButton(subject: thirdSubject)
        }
    }
}

struct SubjectRow_Previews: PreviewProvider {
    static var previews: some View {
        SubjectRow(firstSubject: AppMockContent.mockSubject1, secondSubject: AppMockContent.mockSubject1, thirdSubject: AppMockContent.mockSubject1)
    }
}
