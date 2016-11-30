//
//  AppDelegate.swift
//  Project7
//
//  Created by Jonathan Deguzman on 11/29/16.
//  Copyright © 2016 Jonathan Deguzman. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Storyboard creates a window in which all the view controllers are shown. The other tab window is given its initial view controller and gets set to its rootViewController property.
        // Here, view controller is embedded in a navigation controller, which is embedded inside a tab bar controller. Thus, the root view is the tab bar controller.
        if let tabBarController = window?.rootViewController as? UITabBarController {
            // We need to create a new ViewController by hand, so this means that we need to first get a reference to the storyboard file.
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            // We create our view controller by calling the instantiateViewController method, passing in the storyboard ID of the view controller we want.
            let vc = storyboard.instantiateViewController(withIdentifier: "NavController")
            // Create the new tab bar item and give it the "Top Rated" icon
            vc.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
            // Add our new tab bar to the tab bar controller
            tabBarController.viewControllers?.append(vc)
        }
        
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

