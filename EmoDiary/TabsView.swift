//
//  TabsView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/15.
//

import SwiftUI

struct TabsView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) var eachEmo: FetchedResults<Record>
    @State var tabSelection:Int = 0
    private var colorRGB:[Int] = [165,42,42]
    
    @AppStorage("colorful") private var colorful = "green"
    
    
//    let array = UserDefaults.standard.array(forKey: "colorful")
    
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
                    Image(systemName: "gear")
                }
                .tag(4)
            
        }.tint(ColorController.stringToColor(string: colorful))
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
