//
//  EmotionDetailView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/21.
//

import SwiftUI
import CoreData

struct EmotionDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var emotion:Emotion
    @State private var showingSheet = false
    
    var body: some View {
        List{
            Section{
                HStack {
                    Text(emotion.wrappedEmoji)
                        .font(.title)
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .bottom) {
                            Text(emotion.wrappedName)
                                .fontWeight(.bold)
                        }
                        
                        Text(emotion.wrappedInfo)
                        
                    }
                    
                }
            }
            
            Section{
                ForEach(emotion.recordArray){each in
                    RecordsInEmotionDetailView(date: each.wrappedDate, feelings: each.wrappedFeelings)
                }
                .onDelete(perform: deleteItems)

            }
            
        }
        .navigationTitle(emotion.wrappedName)
        .navigationBarTitleDisplayMode(.automatic)
        .toolbar {
            ToolbarItem (placement: .navigationBarTrailing) {
                Button {
                    showingSheet.toggle()
                } label: {
                    Image(systemName: "highlighter")
                }.sheet(isPresented: $showingSheet,onDismiss:  {
                    
                }, content: {
                    AddEmotionView(emotion:emotion, editMode: true, showingSheet: $showingSheet)
                })
                
            }
        }
        
        
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { emotion.recordArray[$0] }.forEach(viewContext.delete)
            
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
