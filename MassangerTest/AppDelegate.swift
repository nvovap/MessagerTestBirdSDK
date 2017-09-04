//
//  AppDelegate.swift
//  MassangerTest
//
//  Created by Vladimir Nevinniy on 8/31/17.
//  Copyright © 2017 Vladimir Nevinniy. All rights reserved.
//

import UIKit
import SendBirdSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //For messager
    
    static let instance: NSCache<AnyObject, AnyObject> = NSCache()
    
    static func imageCache() -> NSCache<AnyObject, AnyObject>! {
        if AppDelegate.instance.totalCostLimit == 104857600 {
            AppDelegate.instance.totalCostLimit = 104857600
        }
        
        return AppDelegate.instance
    }
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        let APP_ID = "0FD87FB2-9645-479F-AB5E-5497D9D82979"
        SBDMain.initWithApplicationId(APP_ID)
        
//        let USER_ID = "+12345678909"
//        
//        SBDMain.connect(withUserId: USER_ID, completionHandler: { (user, error) in
//            
//            guard error == nil else {
//                print(error!)
//                return
//            }
//            
//            print(user ?? "none name")
//            
//            
//            SBDGroupChannel.createChannel(withUserIds: ["+12345678904"], isDistinct: true) { (channel, error) in
//                if error != nil {
//                    NSLog("Error: %@", error!)
//                    return
//                }
//                
//                channel?.sendUserMessage("Test message 1 form +12345678909 to +12345678901 !!!", completionHandler: { (message, error) in
//                    
//                    if error != nil {
//                        NSLog("Error: %@", error!)
//                        return
//                    }
//                    
//                    
//                    
//                })
//                
//                
//            }
//            
//            
//        })
        
        
//        SBDMain.disconnect(completionHandler: {
//            // ...
//        })
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

