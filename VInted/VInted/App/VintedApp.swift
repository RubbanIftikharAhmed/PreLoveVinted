//
//  VintedApp.swift
//  Vinted
//
//  Created by Rubban Iftikhar on 22/03/2025.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct VintedApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var vm = ItemViewModel()
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(vm)
        }
    }
}
