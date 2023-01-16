//
//  GSK_2022_IOSApp.swift
//  GSK 2022 IOS
//
//  Created by Golam Shakib Khan on 15/9/22.
//

import SwiftUI
import GoogleSignIn

@main
struct GSK_2022_IOSApp: App {
  
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

  var body: some Scene {
    WindowGroup {
      PopularView()
//      SigninView()
//        .onAppear{
//          print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
//          UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
//          GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
//            // Check if `user` exists; otherwise, do something with `error`
//          }
//        }
//        .onOpenURL { url in
//          GIDSignIn.sharedInstance.handle(url)
//        }
    }
  }
}
