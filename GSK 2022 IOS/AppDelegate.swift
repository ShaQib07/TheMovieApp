//
//  AppDelegate.swift
//  GSK 2022 IOS
//
//  Created by Golam Shakib Khan on 26/12/22.
//

import UIKit
import Firebase
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
  
  @available(iOS 9.0, *)
      func application(_ application: UIApplication, open url: URL,
                       options: [UIApplication.OpenURLOptionsKey: Any])
        -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
      }
}
