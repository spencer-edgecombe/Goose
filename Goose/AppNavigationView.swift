//
//  AppNavigationView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-03-20.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct AppNavigationView: View {
    
    var title:String!
    let viewBuilder: () -> Content!
    var body: some View {
        NavigationView {
            Text("") .navigationBarTitle(NSLocalizedString("catalogue_tab_text", comment: ""))
        }
        .font(.system(.largeTitle, design: .rounded))
    }
}

struct AppNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigationView(title: "Catelog")
    }
}
