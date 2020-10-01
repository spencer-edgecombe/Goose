//
//  AppDelegate.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-03-18.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.appBody], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.appBody], for: .selected)
        
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.appLargeTitle]
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont.appSubheading]
        

        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        
        tabBarAppearance.shadowImage = nil
        tabBarAppearance.shadowColor = .clear
        tabBarAppearance.backgroundColor = .appBarBackground
        tabBarAppearance.backgroundEffect = UIBlurEffect(style: .regular)
            
        //UITabBar.appearance().standardAppearance = tabBarAppearance
        
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
    
    let persistentContainerName: String = "UserData"
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: persistentContainerName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                switch error.code {
                    default:
                        print("error")
                }
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                switch nserror.code {
                    default:
                        print("error")
                }
            }
        }
    }
}

