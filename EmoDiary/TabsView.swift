//
//  TabsView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/15.
//

import SwiftUI

struct TabsView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) var eachEmo: FetchedResults<EmoEachTime>
    @State private var tabSelection:Int = 4
    
    var body: some View {
        TabView(selection: $tabSelection) {
            TestView()
                .tabItem {
                    Text("Test")
                    Image(systemName: "gearshape")
                }
                .tag(2)
            
            TodayView()
                .tabItem {
                    Text("Today")
                    Image(systemName: "gearshape")
                }
                .tag(0)
            
            
            SettingsView()
                .tabItem {
                    Text("Settings")
                    Image(systemName: "gearshape")
                }
                .tag(4)
            
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
