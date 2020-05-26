//
//  ContentView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-03-18.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let model: CatalogueModel = {
       let model = CatalogueModel()
        model.loadGroups {
        }
        model.loadSubjects {
        }
        return model
    }()
    var body: some View {
        TabView {
                CatalogueView(model: model)
            .tabItem {
                    VStack {
                        Image(systemName: "studentdesk")
                        Text("Catalogue")
                    }
            }
        }
        .accentColor(UIColor.systemYellow.color)
        .font(.appSubheading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .light)
    }
}
