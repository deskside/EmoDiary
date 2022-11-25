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
    @State var emotion:Emotion
    
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
                            .lineLimit(2)
                    }
                    
                }
            }
            
            Section{
                ForEach(emotion.recordArray){each in
                    RecordsInEmotionDetailView(date: each.wrappedDate, feelings: each.wrappedFeelings)
                }.swipeActions(edge:.trailing){
                    Button(role:.destructive,action: {
                        deleteItem()
                    },label:{
                        Label("Delete Employee",systemImage: "trash")
                    })
                }
            }
            
            Section{
                
            }
            }
            
        }
        
        
    private func deleteItem(){
        let itemToDelete = emotion
        do{
            viewContext.delete(itemToDelete)
            try viewContext.save()
        }
        catch{
            print("Error while deleting employee \(error.localizedDescription)")
        }
    }
}
