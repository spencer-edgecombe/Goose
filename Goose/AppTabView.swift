//
//  AppTabView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-03-18.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct AppTabView: View {
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        UITabBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        TabView {
            NavigationView {
                CatalogueView()
                    .navigationBarTitle(AppStrings.catalogueTabTitle)
            }
                .tabItem {
                    Image(systemName: AppStrings.catalogueTabSymbol)
                    Text(AppStrings.catalogueTabTitle)
            }
        }
        .accentColor(Color(AppColors.darkYellow))
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
