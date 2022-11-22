//
//  AddEmoEachTimeView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/21.
//

import SwiftUI

struct AddEmoEachTimeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var emoEachTime: FetchedResults<EmoEachTime>
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var emotions:FetchedResults<Emotions>
    
    @Binding var showingSheet:Bool
    @State private var showingAlert = false
    @State private var addFeelings:String = ""
    @State private var addDate:Date = Date()
//    @State private var addEmotions:Emotions =
    @State var selection:String = ""
    
    var body: some View {
        NavigationStack{
            List {
                Section {
                    TextField(text: $addFeelings) {
                        Text("Feelings")
                    }
                    
                    DatePicker(selection: $addDate, displayedComponents:[.date,.hourAndMinute]) {
                        Text("Date")
                        
                    }
                    
            
                    
                    Picker("Emotion", selection: $selection) {
                        ForEach(emotions) {each in
                            Text("\(each.emoji ?? "") \(each.name ?? "")")
                                .tag(each.name ?? "")
                        }
                    }
                }
                Button {
                    
                    //                if addName.trimmingCharacters(in: .whitespacesAndNewlines) != "" && addEmoji.trimmingCharacters(in: .whitespaces) != "" && addEmoji.containsOnlyEmoji == true{
                    //
                    //                    addCoreDataEmotion(name: addName.trimmingCharacters(in: .whitespacesAndNewlines), emoji: addEmoji.trimmingCharacters(in: .whitespacesAndNewlines), info: addInfo.trimmingCharacters(in: .whitespacesAndNewlines))
                    //                    addName = ""
                    //
                    //                    showingSheet = false
                    //
                    //                }else{
                    //                    self.showingAlert = true
                    //                }
                    
                } label: {
                    Text("Add")
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Please input something to describe your emotion"),
                          message: Text(""),
                          dismissButton: .default(Text("Got it")))
                }

            }
        }}
    
    func addCoreDataEmoEachTime(name:String, emoji:String, info:String){
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

