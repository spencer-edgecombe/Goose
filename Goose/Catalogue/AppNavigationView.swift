//
//  AppNavigationView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-14.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct

struct AppNavigationView: View {
    var title: String
    var body: some View {
        NavigationView {
            navigationBarTitle(title)
        }
    
    }
}

struct AppNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigationView()
    }
}
