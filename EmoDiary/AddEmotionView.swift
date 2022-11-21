//
//  AddEmotionView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/20.
//

import SwiftUI

struct AddEmotionView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var emotions: FetchedResults<Emotions>
    
    @Binding var showingSheet :Bool
    @State private var showingAlert = false
    @State private var addName:String = ""
    @State private var addEmoji:String = ""
    @State private var addInfo:String = ""
    
    var body: some View {
        
        List {
            Section {
                TextField(text: $addName) {
                    Text("Pick a word for your emotion")
                }
                
                TextField(text: $addEmoji){
                    Text("Pick an emoji  for this emotion 😄")
                }
                
                TextField(text: $addInfo){
                    Text("Describe your emotion here")
                }
            }
            
            
            
            Button {
                
                if addName.trimmingCharacters(in: .whitespacesAndNewlines) != "" && addEmoji.trimmingCharacters(in: .whitespaces) != "" && addEmoji.containsOnlyEmoji == true{
                    
                    addCoreDataEmotion(name: addName.trimmingCharacters(in: .whitespacesAndNewlines), emoji: addEmoji.trimmingCharacters(in: .whitespacesAndNewlines), info: addInfo.trimmingCharacters(in: .whitespacesAndNewlines))
                    addName = ""
                    
                    showingSheet = false
                    
                }else{
                    self.showingAlert = true
                }
                
            } label: {
                Text("Add")
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Please input something to describe your emotion"),
                      message: Text(""),
                      dismissButton: .default(Text("Got it")))
            }
            
        }
        
        
    }
    
    func addCoreDataEmotion(name:String, emoji:String, info:String){
        let coreData = Emotions(context: viewContext)
        coreData.id = UUID()
        coreData.name = name
        coreData.emoji = emoji
        coreData.info = info
        do{
            try viewContext.save()
        }catch{
            
        }
    }
}


