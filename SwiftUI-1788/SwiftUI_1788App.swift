//
//  SwiftUI_1788App.swift
//  SwiftUI-1788
//
//  Created by Nikkru on 20.04.2022.
//

import SwiftUI
import VKSdkFramework

@main
struct SwiftUI_1788App: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: MyAppDelegate
    
    var body: some Scene {
        WindowGroup {
//            LoginView()
            ContainerView()
        }
    }
}

class MyAppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOption: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        VKSdk.processOpen(url, fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
        return true
    }
}
