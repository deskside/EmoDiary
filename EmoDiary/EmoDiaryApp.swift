//
//  EmoDiaryApp.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/14.
//

import SwiftUI

@main
struct EmoDiaryApp: App {
    let persistenceController = PersistenceController.shared

    
    @AppStorage("localization") private var localization = "zh"
    @AppStorage("isDarkMode") private var isDarkMode = false
    

    var body: some Scene {
        WindowGroup {
            TabsView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
                .environment(\.locale, .init(identifier: localization))
        }
    }
}
