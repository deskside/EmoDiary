//
//  AddEmotionView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/20.
//

import SwiftUI
import CoreData

struct AddEmotionView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var emotions: FetchedResults<Emotion>
    
    @State var emotion = Emotion()
    var editMode:Bool
    
    @Binding var showingSheet:Bool
    @State private var showingAlert = false
    @State private var addName:String = ""
    @State private var addEmoji:String = ""
    @State private var addInfo:String = ""
    @State private var addColor:Color = Color(hexadecimal: Constants.defaultColor)
    var body: some View {
        
        List {
            
            Section {
                TextField(text: $addName) {
                    Text("Pick a word for your emotion")
                }
                
                TextField(text: $addEmoji){
                    Text(editMode ? emotion.wrappedEmoji : "Pick an emoji  for this emotion 😄")
                }
                
                TextField(text: $addInfo, axis: .vertical){
                    Text(editMode ? emotion.wrappedInfo : "Describe your emotion here")
                }
                
                ColorPicker("Pick a color", selection: $addColor)
                    .onAppear{
                        if editMode {
                            addName = emotion.wrappedName
                            addEmoji = emotion.wrappedEmoji
                            addInfo = emotion.wrappedInfo
                            addColor = emotion.wrappedColor
                        }
                    }
            }
            
            
            
            
            
            Button {
                
                if addName.trimmingCharacters(in: .whitespacesAndNewlines) != "" && addEmoji.trimmingCharacters(in: .whitespaces) != "" && addEmoji.containsOnlyEmoji == true{
                    
                    addCoreDataEmotion()
                    
                    
                    showingSheet = false
                    
                }else{
                    self.showingAlert = true
                }
                
            } label: {
                Text(editMode ? "Edit" : "Add")
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Please input something to describe your emotion"),
                      message: Text(""),
                      dismissButton: .default(Text("Got it")))
            }
            
        }
        
    }
    
    private func addCoreDataEmotion(){
        var coreData = Emotion()
        
        if editMode{
            coreData = emotion
        }else{
            coreData = Emotion(context: viewContext)
        }
        
        
        coreData.id = UUID()
        coreData.name = addName.trimmingCharacters(in: .whitespacesAndNewlines)
        coreData.emoji = addEmoji.trimmingCharacters(in: .whitespacesAndNewlines)
        coreData.info = addInfo.trimmingCharacters(in: .whitespacesAndNewlines)
        coreData.color = addColor.hex
        do{
            try viewContext.save()
        }catch{
            
        }
    }

}


