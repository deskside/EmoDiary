//
//  EmoEachTimeLineView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/21.
//

import SwiftUI
import CoreData


struct RecordLineView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var record:Record
    
    
    var body: some View {
        HStack {
            ZStack{
                
                
                Circle()
                    .frame(CGSize(width: 50, height: 50))
                    .foregroundColor(record.emotion.wrappedColor)
                    
                
                Text(record.emotion.wrappedEmoji)
                    .font(.title)
                
            }
            
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text(record.emotion.wrappedName)
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text(DateController.dateToString(date: record.wrappedDate))
                        .font(.footnote)
                }
                Text(record.wrappedFeelings)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
            }
            
            Spacer()
        }
        .padding(.top, 30)
        .padding(.horizontal, 20)
        .foregroundColor(isDarkMode ? .white : .black)
        
        
    }
}

