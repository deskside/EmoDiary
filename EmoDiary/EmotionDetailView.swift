//
//  EmotionDetailView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/21.
//

import SwiftUI
import CoreData

struct EmotionDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var emotion:Emotion
    
    var body: some View {
        List{
            Section{
                HStack {
                    Text(emotion.emoji ?? "")
                        .font(.title)
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .bottom) {
                            Text(emotion.name ?? "")
                                .fontWeight(.bold)
                            
                            
                        }
                        
                        Text(emotion.info ?? "")
                            .lineLimit(2)
                    }
                    
                }
            }
            
            Section{
                ForEach(emotion.recordArray){each in
                    RecordsInEmotionDetailView(date: each.wrappedDate, feelings: each.wrappedFeelings)
                    
                }
            }
            
        }
        
        
    }
}
