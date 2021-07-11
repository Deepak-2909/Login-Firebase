//
//  LoginApp.swift
//  Login
//
//  Created by Deepak on 11/07/21.
//

import SwiftUI
import Firebase
import UIKit

@main
struct LoginApp: App {
    
    // Create a reference to app delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            RegisterView()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate:NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions:
                [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Configure Firebase
        FirebaseApp.configure()
        return true
    }
}
