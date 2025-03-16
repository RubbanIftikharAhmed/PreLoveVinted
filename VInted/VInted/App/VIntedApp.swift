//
//  VIntedApp.swift
//  VInted
//
//  Created by Rubban Iftikhar on 16/03/2025.
//

import SwiftUI

@main
struct VIntedApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
