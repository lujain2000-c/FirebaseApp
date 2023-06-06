//
//  FirebaseAppApp.swift
//  FirebaseApp
//
//  Created by لجين إبراهيم الكنهل on 16/11/1444 AH.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
   // func applicationDidEnterBackground(_ application: UIApplication) {
      
   // }
//    func applicationWillTerminate(_ application: UIApplication) {
//        <#code#>
//    }
    
}
@main
struct FirebaseAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            SignUpView()
        }
    }
}
