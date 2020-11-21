//
//  ContentView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-03-18.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showFirstRunModal: Bool = AppModel.shared.isFirstRun
    var body: some View {
        TabView {
            Catalog()
                .tabItem {
                    VStack {
                        Image(systemName: "newspaper.fill")
                        Text(R.string.localizable.titleCatalog())
                    }
                }
            CoursePlanView()
                .tabItem {
                    VStack {
                        Image(systemName: "heart.fill")
                        Text(R.string.localizable.titleCourseplanner())
                    }
                }
            SettingsView()
                .tabItem {
                    VStack {
                        Image(systemName: "gearshape.fill")
                        Text(R.string.localizable.titleSettings())
                    }
                }
        }
        .accentColor(.yellow)
        .font(.appSubheading)
        .sheet(isPresented: $showFirstRunModal, content: {
            WelcomeView(isPresented: $showFirstRunModal)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .light)
    }
}
