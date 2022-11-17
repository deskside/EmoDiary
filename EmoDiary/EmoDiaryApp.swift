//
//  EmoDiaryApp.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/14.
//

import SwiftUI

@main
struct EmoDiaryApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabsView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
