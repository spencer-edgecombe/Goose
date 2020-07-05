//
//  ContentView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-03-18.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let model: CatalogModel = {
       let model = CatalogModel()
     
        return model
    }()
    var body: some View {
        TabView {
                CatalogView()
            .tabItem {
                VStack {
                    Image(systemName: "studentdesk")
                    Text("Catalog")
                }
            }
        }
        .accentColor(UIColor.systemBlue.color)
        .font(.appSubheading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .light)
    }
}
