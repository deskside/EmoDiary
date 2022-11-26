//
//  SwiftUIView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/18.
//

import SwiftUI
import SwiftUIX
import NVMColor
import CoreData

struct TestView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) var emotions: FetchedResults<Emotion>
    
    @State private var emotion = Emotion()
    
    var test:String{
        let themeColor = Color.green
        let a = themeColor.toUIColor()
        
        return a?.hex ?? "WHAT"
    }
    
    var body: some View {
        Link("SwiftUI Tutorials", destination: URL(string: "https://www.simpleswiftguide.com")!)

    }
    
    
    
    
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

