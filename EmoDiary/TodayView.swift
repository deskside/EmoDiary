//
//  TodayView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/15.
//

import SwiftUI

struct TodayView: View {
    @State private var showingAlerts = true
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State var showingSheet:Bool = false
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVStack{
                    ZStack(alignment: .bottomTrailing) {
                        Image("mountain")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .ignoresSafeArea()
                        
                        
                        Image("avatar")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: 75, height: 75)
                            .padding()
                            .offset(x: 0, y: 30)
                    }
                    ForEach(1...10, id: \.self){ _ in
                        NavigationLink {
                            TestView()
                        } label: {
                            EmoEachTimeLineView()
                            
                        }
                    }
                    
                    
                    
                    Spacer()
                    
                }
            }
            .background(.secondarySystemBackground)
            .ignoresSafeArea()
            .navigationTitle("Today")
            .toolbar {
                ToolbarItem {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Text("Add")
                    }.sheet(isPresented: $showingSheet) {
                        AddEmoEachTimeView(showingSheet: $showingSheet)
                        
                    }
                }
            }
            
        }
    }}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
