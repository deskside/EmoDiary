//
//  OneTouchView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/26.
//

import SwiftUI

struct OneTouchView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var emotions: FetchedResults<Emotion>
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            LazyHGrid(rows: [GridItem(.fixed(60))]){
                ForEach(emotions){each in
                    Button {
                        addRecord(emotion: each)
                    } label: {
                        ZStack{
                            Circle()
                                .frame(CGSize(width: 50, height: 50))
                                .foregroundColor(each.wrappedColor)
                            Text(each.wrappedEmoji)
                                .font(.title)
                        }
                    }

                    
                }.padding(.leading,15)
            }
        }
    }
    
    private func addRecord(emotion:Emotion){
        
        let newRecord = Record(context: viewContext)
        newRecord.id = UUID()
        newRecord.feelings = ""
        newRecord.timestamp = Date()
        
        // Core data Emotion
        newRecord.emotion = emotion
        
        do{
            try viewContext.save()
        }catch{
            print("Error while saving Employee Data \(error.localizedDescription)")
        }
    }
}


