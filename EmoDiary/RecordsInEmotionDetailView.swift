//
//  RecordsInEmotionDetailView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/25.
//

import SwiftUI

struct RecordsInEmotionDetailView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @State var name:String = "Hopeful"
    @State var date:Date 
    @State var emoji:String = "🤩"
    @State var feelings:String
    
    var body: some View {
        VStack{
            Text(feelings)
                .multilineTextAlignment(.leading)

            Text(DateController.dateToString(date: date))
                .font(.footnote)
        }
    }
}

