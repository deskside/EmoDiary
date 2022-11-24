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
    
    
    
    @Binding var showingSheet:Bool
    @State private var showingAlert = false
    @State private var addFeelings:String = ""
    @State private var addDate:Date = Date()
    @State private var addEmotion:String = "Anxious"
    
    @State private var selectedEmotion = Emotion()
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var emotions:FetchedResults<Emotion>
    
    
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
                    
                    
                    Picker("Emotion", selection: $selectedEmotion) {
                        ForEach(emotions, id:\.self) {each in
                            Text("\(each.emoji ?? "") \(each.name ?? "")")
                                .tag(each.name ?? "")
                            
                            }
                            
                        }
                    }
                Button {
                    addRecord()
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
    
    private func addRecord(){
        let newRecord = Record(context: viewContext)
        newRecord.id = UUID()
        newRecord.feelings = addFeelings
        newRecord.timestamp = addDate
        
        // Core data Emotion
        newRecord.emotion = selectedEmotion
        
        do{
            try viewContext.save()
        }catch{
            print("Error while saving Employee Data \(error.localizedDescription)")
        }
    }
    
    
}

