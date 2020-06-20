//
//  AppDelegate.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-03-18.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.appLabel], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.appLabel], for: .selected)
        let navigationBarAppearance: UINavigationBarAppearance = UINavigationBarAppearance()
        
        navigationBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.appLargeTitle]
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.appSubheading]
        navigationBarAppearance.backgroundColor = .appBarBackground
        navigationBarAppearance.shadowColor = .clear
        navigationBarAppearance.shadowImage = nil
        navigationBarAppearance.backgroundEffect = UIBlurEffect(style: .extraLight)
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        
        tabBarAppearance.shadowImage = nil
        tabBarAppearance.shadowColor = .clear
        tabBarAppearance.backgroundColor = .appBarBackground
        tabBarAppearance.backgroundEffect = UIBlurEffect(style: .regular)
            
        UITabBar.appearance().standardAppearance = tabBarAppearance
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

