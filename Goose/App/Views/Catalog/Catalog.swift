//
//  Catalog.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-09-19.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct Catalog: View {
    var isMock: Bool
    var body: some View {
        NavigationView {
            FacultyListView()
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
    
    init(_ isMock: Bool = false) {
        self.isMock = isMock
    }
}

struct Catalog_Previews: PreviewProvider {
    static var previews: some View {
        Catalog(true)
    }
}
