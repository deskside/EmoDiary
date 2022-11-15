//
//  TabView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/15.
//

import SwiftUI

struct TabView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) var eachEmo: FetchedResults<EmoEachTime>
    @State private var tabSelection:Int = 1
    

    var body: some View {
        TabView(selection: $tabSelection) {
//            TestView()
//                .tabItem {
//                    Text("测试")
//                    Image(systemName: Constants.cardICON)
//                }
//                .tag(1)
//
//            StatisticsView()
//                .tabItem {
//                    Text("统计")
//                    Image(systemName: Constants.statisticsICON)
//                }
//                .tag(2)
//
//            TodayView()
//                .tabItem {
//                    Text("今天")
//                    Image(systemName: Constants.todayICON)
//                }
//                .tag(3)
//
//            SettingView()
//                .tabItem {
//                    Text("设置")
//                    Image(systemName: Constants.gearICON)
//                }
//                .tag(4)
            
           
            
            
        }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
