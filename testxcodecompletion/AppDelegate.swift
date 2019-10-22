//
//  AppDelegate.swift
//  testxcodecompletion
//
//  Created by ha tuong do on 10/21/19.
//  Copyright © 2019 alpine. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
                
        // I successfully run this code
        // I can see "Brat  30" data in Realm database
        
        // print("where Realm db located ",Realm.Configuration.defaultConfiguration.fileURL)
        
        // add this debug code just for Realm to create our database
//        let data = Data()
//        data.name = "Brat"
//        data.age = 30

        do {
            _ = try Realm()
        } catch {
            print("Error initialising new realm, \(error)")
        }

//        do {
//        let realm = try Realm()
//              //  try realm.write { realm.add(data) }
//        } catch {
//            print ("error initialize Realm database, \(error)" )
//        }
        
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

