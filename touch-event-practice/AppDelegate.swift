//
//  AppDelegate.swift
//  touch-event-practice
//
//  Created by jinsei_shima on 2020/06/29.
//  Copyright © 2020 jinsei_shima. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

//  func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    self.window = TouchDetectWindow(frame: UIScreen.main.bounds)
//    let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "root_tabbar_controller")
//    self.window?.rootViewController = controller
//    self.window?.makeKeyAndVisible()
//    return true
//  }

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

//    self.window = TouchDetectWindow(frame: UIScreen.main.bounds)
//    let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "root_tabbar_controller")
//    self.window?.rootViewController = controller
//    self.window?.makeKeyAndVisible()

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

