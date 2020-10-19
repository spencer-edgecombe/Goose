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
                        Image(systemName: "newspaper.fill")
                        Text("Catalog")
                    }
                }
            CoursePlanView()
                .tabItem {
                    VStack {
                        Image(systemName: "heart.fill")
                        Text("Saved")
                    }
                }
                
        }
        .accentColor(.yellow)
        .font(.appSubheading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .light)
    }
}
