//
//  SettingsView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/15.
//

import SwiftUI

struct SettingsView: View {
    //    @AppStorage("darkModeAccording") private var darkModeAccording = 0
    //    @Environment(\.colorScheme) var colorScheme
    @AppStorage("isDarkMode") private var isDarkMode = false

    
    var body: some View {
        NavigationStack {
            List{
                // MARK: Pro
                Section {
                    Text("Pro purchasing")
                    NavigationLink(destination:
                                    Label("Test", systemImage: "person.crop.circle.badge.questionmark")
                        .symbolRenderingMode(isDarkMode ? .multicolor : .monochrome)
                    ) {
                        Label("Test", systemImage: "person.crop.circle.badge.questionmark")
                            .symbolRenderingMode(.multicolor)
                            .foregroundColor(isDarkMode ? .white : .black)
                    }
                    
                } header: {
                    Text("Pro purchasing")
                }
                
                // MARK: Emotions
                
                Section {
                    NavigationLink {
                        EmotionsManagementView()
                    } label: {
                        Label("Emotions", systemImage: "heart.text.square")
                            .symbolRenderingMode(isDarkMode ? .multicolor : .monochrome)
                            .foregroundColor(isDarkMode ? .white : .black)
                    }
                    
                } header: {
                    Text("Emotions")
                }
                
                // MARK: Appearence
                NavigationLink {
                    AppearenceSettingsView()
                } label: {
                    Text("Appearence")
                }
            }
            
            .listStyle(.sidebar)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.automatic)
            
        }
        
        
    }
}
