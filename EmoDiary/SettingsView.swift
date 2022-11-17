//
//  SettingsView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/15.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        NavigationStack {
            List{
                Section {
                    Text("Test")
                    NavigationLink(destination: IconTextOneLineView(icon: "square.and.arrow.down.on.square.fill", text: "Something")) {
                        IconTextOneLineView(icon: "square.and.arrow.down.on.square.fill", text: "Something")
                    }
                    
                } header: {
                    Text("Test")
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
