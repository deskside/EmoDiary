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
    
    @AppStorage("localization") private var localization = "zh"
    
    @State private var isColorAutoMatchEmo = true
    @State private var bgColor = Color.blue.opacity(0.5)
    
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
                
                // MARK: Appearence
                Section {
                    
                    // MARK: Color auto-match emotion
                    Toggle(isOn: $isColorAutoMatchEmo) {
                        Label("Auto-match emotions", systemImage: "paintpalette")
                            .symbolRenderingMode(isColorAutoMatchEmo ? .multicolor : .monochrome)
                            .foregroundColor(isDarkMode ? .white : .black)
                    }
                    
                    
                    
                    if isColorAutoMatchEmo == false{
                        HStack {
                            Label("Custom color") {
                                Image(systemName: "circle.hexagongrid.fill")
                                    .symbolRenderingMode(isColorAutoMatchEmo ? .multicolor : .monochrome)
                                    .foregroundColor(bgColor)
                            }
                            
                            
                            ColorPicker("", selection: $bgColor, supportsOpacity: false)
                                .padding(.horizontal)
                        }
                    }
                    
                    // MARK: Dark mode
                    Toggle(isOn: $isDarkMode) {
                        Label("Dark mode", systemImage: "moon.circle.fill")
                            .symbolRenderingMode(isDarkMode ? .multicolor : .monochrome)
                            .foregroundColor(isDarkMode ? .white : .black)
                    }
                    .toggleStyle(.switch)
                    
                    //                    Picker(selection: $darkModeAccording) {
                    //                        Text("Light")
                    //                            .tag(0)
                    //                        Text("Dark")
                    //                            .tag(1)
                    //                        Text("Auto")
                    //                            .tag(2)
                    //                    } label: {
                    //                        Label("Dark mode", systemImage: "moon.circle.fill")
                    //                            .symbolRenderingMode(isDarkMode ? .multicolor : .monochrome)
                    //                            .foregroundColor(isDarkMode ? .white : .black)
                    //                    }
                    //                    .onSubmit {
                    //                        switch darkModeAccording{
                    //                        case 0: isDarkMode = false
                    //                        case 1: isDarkMode = true
                    //                        default: isDarkMode = colorScheme == .dark ? true : false
                    //                        }
                    //                    }
                    
                    
                    
                    Picker(selection: $localization) {
                        Text("English")
                            .tag("en")
                        Text("简体中文")
                            .tag("zh")
                    } label: {
                        Label("Language", systemImage: localization == "en" ? "dollarsign.circle" : "yensign.circle")
                            .symbolRenderingMode(isDarkMode ? .multicolor : .monochrome)
                            .foregroundColor(isDarkMode ? .white : .black)
                    }
                    
                } header: {
                    Text("Appearence")
                } footer: {
                    Text("Test")
                    
                }
                
            }
            .listStyle(.sidebar)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
