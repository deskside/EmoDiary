//
//  EmotionsManagementView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/19.
//

import SwiftUI

struct EmotionsManagementView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var emotions: FetchedResults<Emotions>
    @State private var showingAlert = false
    @State var addLabel:String = ""
    @State private var showingSheet = false
    
    var body: some View {
        List{
            Section(header: Image(systemName: "plus.square.on.square")){
                TextField(text: $addLabel) {
                    Text("Describe your emotion")
                }
                Button {
                    if addLabel.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
                        
                        addCoreData(text: addLabel.trimmingCharacters(in: .whitespacesAndNewlines))
                        addLabel = ""
                        
                        
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
            
            Section(header: Image(systemName: "tag")){
                ForEach(emotions){each in
                    HStack {
                        Text(each.emoji ?? "")
                            .font(.title)
                        
                        VStack(alignment: .leading) {
                            HStack(alignment: .bottom) {
                                Text(each.name ?? "")
                                    .fontWeight(.bold)
                                
                                
                            }
                            
                            Text(each.info ?? "")
                                .lineLimit(2)
                        }
                        
                    }

                }
                .onDelete(perform: deleteItems)
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
                    TestView()
                    
                }
            }
        }
        }
    
    
    func addCoreData(text:String){
        let coreData = Emotions(context: viewContext)
        coreData.id = UUID()
        coreData.name = text
        do{
            try viewContext.save()
        }catch{
            
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
