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
    @State private var tabSelection:Int = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            TodayView()
                .tabItem {
                    Text("测试")
                    Image(systemName: "gearshape")
                }
                .tag(2)
            
            StatisticsView()
                .tabItem {
                    Text("统计")
                    Image(systemName: "gearshape")
                }
                .tag(0)
            
            
            SettingsView()
                .tabItem {
                    Text("设置")
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
