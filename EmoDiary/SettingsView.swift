//
//  SettingsView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/15.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("localization") private var localization = "zh"
    
    
    var body: some View {
        NavigationStack {
            List{
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
                } footer: {
                    Text("Test")
                    
                }
                
                Section {
                    Toggle(isOn: $isDarkMode) {
                        Label("Dark mode", systemImage: "moon.circle.fill")
//                            .symbolVariant(isDarkMode ? .fill : .none)
                            .symbolRenderingMode(isDarkMode ? .multicolor : .monochrome)
                        
                    }
                    .toggleStyle(.switch)
                    .foregroundColor(isDarkMode ? .white : .black)
                    
                    Picker(selection: $localization) {
                        Text("English")
                            .tag("en")
                        Text("简体中文")
                            .tag("zh")
                    } label: {
                        Label("Language", systemImage: localization == "en" ? "dollarsign.circle" : "yensign.circle")
                            .symbolRenderingMode(isDarkMode ? .multicolor : .monochrome)
                    }
                    
                } header: {
                    Text("Appearence")
                } footer: {
                    Text("Test")
                    
                }
                
            }
            .listStyle(.sidebar)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
