//
//  AddEmoEachTimeView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/21.
//

import SwiftUI

struct AddRecordView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var emoEachTime: FetchedResults<Record>
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var emotions:FetchedResults<Emotion>
    
    @Binding var showingSheet:Bool
    @State private var showingAlert = false
    @State private var addFeelings:String = ""
    @State private var addDate:Date = Date()
    @State private var addEmotion:String = "Anxious"
    
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
                    
            
                    
                    Picker("Emotion", selection: $addEmotion) {
                        ForEach(emotions) {each in
                            Text("\(each.emoji ?? "") \(each.name ?? "")")
                                .tag(each.name ?? "")
                            
                            }
                            
                        }
                    }
                Button {
                    addCoreDataRecord(emotionName: addEmotion, feelings: addFeelings, timestamp: addDate)
                    showingSheet.toggle()
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
        }
    
    func addCoreDataRecord(emotionName:String, feelings:String, timestamp:Date){
        let coreData = Record(context: viewContext)
        coreData.id = UUID()
        
        coreData.emotion = emotions.first
        
        coreData.feelings = feelings
        coreData.timestamp = timestamp
        do{
            try viewContext.save()
        }catch{
            
        }
    }
    
    
}

