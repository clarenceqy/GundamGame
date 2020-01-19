//
//  AppDelegate.swift
//  GundamMobile
//
//  Created by YiChao Qin on 11/28/19.
//  Copyright © 2019 YiChao Qin. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        
        //First time
        //**************************************
        let defaults = UserDefaults.standard;
        if(defaults.string(forKey: "Volume") == nil){
            defaults.set(Float(0.5), forKey: "Volume")
        }
        if(defaults.string(forKey: "Music") == nil){
            defaults.set(true, forKey: "Music")
        }
        if(defaults.string(forKey: "LaunchScreen") == nil){
            defaults.set("EF", forKey: "LaunchScreen")

        }
        
        //**************************************
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) { }
    
    func applicationDidEnterBackground(_ application: UIApplication) { }
    
    func applicationWillEnterForeground(_ application: UIApplication) { }
    
    func applicationDidBecomeActive(_ application: UIApplication) { }
    
    func applicationWillTerminate(_ application: UIApplication) {
        CoreDataStack.shared.saveContext()
    }
    
}
