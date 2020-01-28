//
//  AppDelegate.swift
//  AppStates
//
//  Created by Sanjay Patil on 1/27/20.
//  Copyright © 2020 Sanjay Patil. All rights reserved.
//

import UIKit

enum AppState {
    case notRunning
    case launching
    case initialized
    case inactive
    case active
    case background
    case wakingUp
    case terminated
}

extension AppState:CustomStringConvertible {
    var description: String {
        switch self {
        case .notRunning:
            return "Not Running"
        case .launching:
            return "launching"
        case .initialized:
            return "initialized"
        case .inactive:
            return "Inactive"
        case .active:
            return "Active"
        case .background:
            return "Background"
        case .wakingUp:
            return "Waking UP"
        case .terminated:
            return "Terminated"
        }
    }
}
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var state:AppState = .notRunning
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("\(#function) called: \(state) -> \(AppState.launching)")
        state = .launching
        return true
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("\(#function) called: \(state) -> \(AppState.initialized)")
        state = .initialized
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("\(#function) called: \(state) -> \(AppState.active)")
        state = .active
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("\(#function) called: \(state) -> \(AppState.wakingUp)")
        state = .wakingUp
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("\(#function) called: \(state) -> \(AppState.inactive)")
        state = .inactive
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("\(#function) called: \(state) -> \(AppState.background)")
        state = .background
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("\(#function) called: \(state) -> \(AppState.terminated)")
        state = .terminated
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

