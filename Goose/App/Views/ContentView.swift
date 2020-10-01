//
//  ContentView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-03-18.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Catalog()
                .tabItem {
                    VStack {
                        Image(systemName: "studentdesk")
                        Text("Catalog")
                    }
                }
            CoursePlanView()
                .tabItem {
                    VStack {
                        Image(systemName: "rectangle.on.rectangle")
                        Text("Course Plan")
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
