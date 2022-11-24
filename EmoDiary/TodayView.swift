//
//  TodayView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/15.
//

import SwiftUI

struct TodayView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var records: FetchedResults<Record>
    
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
                    Group {
                        ForEach(records){ each in
                            NavigationLink{
                                TestView()
                            } label: {
                                RecordLineView(name: each.emotion?.name ?? "No name",date: each.timestamp ?? Date(),emoji: each.emotion?.emoji ?? "❎", feelings: each.feelings ?? "No feelings" )
                                
                            }
                        }
                    }
                    
                    Group {
                        ForEach(1...10, id: \.self){ _ in
                            NavigationLink {
                                TestView()
                            } label: {
                                RecordLineView()
                                
                            }
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
                        AddRecordView(showingSheet: $showingSheet)
                        
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
