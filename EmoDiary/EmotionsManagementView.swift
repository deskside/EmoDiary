//
//  EmotionsManagementView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/19.
//

import SwiftUI

struct EmotionsManagementView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key:"name", ascending: true)]) var emotions: FetchedResults<Emotions>
    
    @State var showingSheet = false
    
    @State var nameTemp:String = ""
    @State var emojiTemp:String = ""
    @State var infoTemp:String = ""
    
    var body: some View {
        List{
            
            Section(header: Image(systemName: "tag")){
                ForEach(emotions){each in
                    
                    
                    EmotionLineView(name: each.name ?? "", emoji: each.emoji ?? "", info:each.info ?? "")
                    
                }
                .onDelete(perform: deleteItems)
                .swipeActions(edge: .leading, allowsFullSwipe:true) {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Text("Edit")
                    }.sheet(isPresented: $showingSheet) {
                        
                        AddEmotionView(showingSheet: $showingSheet)
                    }
                    
                }
            }
        }
        .navigationTitle("Emotions")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem (placement: .navigationBarTrailing) {
                Button {
                    showingSheet.toggle()
                } label: {
                    Image(systemName: "plus.app")
                }.sheet(isPresented: $showingSheet) {
                    AddEmotionView(showingSheet: $showingSheet)
                }
            }
        }
        
    }
    
    
    
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { emotions[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct EmotionsManagementView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionsManagementView()
    }
}
