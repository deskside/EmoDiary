//
//  AppearenceSettingsView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/26.
//

import SwiftUI

struct AppearenceSettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @AppStorage("localization") private var localization = "zh"
    
    @State private var isColorAutoMatchEmo = true
    //    @State private var themeColor = Color.blue.opacity(0.5)
    //
    //    let defaults = UserDefaults.standard
    @AppStorage("colorful") private var colorful = ""
    @State private var colorSelected:String = "yellow"
    
    
    var body: some View {
        
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
                        .foregroundColor(ColorController.stringToColor(string: colorSelected))
                }
                
                Picker("",selection: $colorSelected){
                    ForEach(ColorController.systemColorArray,id:\.self){each in
                        Text(each)
                            .foregroundColor(ColorController.stringToColor(string: each))
                            .tag(each)
                    }
                }
                .pickerStyle(.navigationLink)
                .onAppear(){
                    colorful = colorSelected
                }
                
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
        
        
        // MARK: Language
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
        
        
    }
}

