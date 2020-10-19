//
//  File.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-10-01.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

class SubjectListViewModel: ListViewModel<Subject> {

    var faculty: Faculty

    init(faculty: Faculty, _ isMock: Bool = false) {
        self.faculty = faculty
        super.init(Client.shared.subjectsURL(), isMock)
    }

    override func resourcesDidLoadSuccessfully(resources: [Subject]) {
        super.resourcesDidLoadSuccessfully(resources: resources)
        self.resources = resources.filter { $0.faculty == faculty.code }
    }
}

struct SubjectListViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
