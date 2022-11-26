//
//  TodayView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/15.
//

import SwiftUI
import CoreData

struct TodayView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var records: FetchedResults<Record>
    @FetchRequest(sortDescriptors: []) var emotions: FetchedResults<Emotion>
    
    @State private var showingAlerts = true
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State var showingSheet:Bool = false
    var body: some View {
        
        NavigationStack {
            ScrollView{
                LazyVStack{
                    
                    // MARK: Cover
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
                    .padding(.bottom, 15)
                    
                    // MARK: OneTouch
                    ScrollView(.horizontal,showsIndicators: false){
                        
                        LazyHGrid(rows: [GridItem(.fixed(80))]){
                            ForEach(emotions){each in
                                ZStack{
                                    
                                    
                                    Circle()
                                        .frame(max: CGSize(width: 50, height: 50))
                                        .foregroundColor(each.wrappedColor)
                                        
                                    
                                    Text(each.wrappedEmoji)
                                        .font(.title)
                                    
                                }
                                
                            }.padding(.leading,15)
                        }
                    }
                    
                    // MARK: Records
                    Group {
                        ForEach(records){ each in
                            NavigationLink{
                                TestView()
                            } label: {
                                RecordLineView(name: each.emotion.wrappedName ,date: each.wrappedDate,emoji: each.emotion.wrappedEmoji, feelings: each.wrappedFeelings)
                                
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
