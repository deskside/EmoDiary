//
//  EmotionDetailView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/21.
//

import SwiftUI
import CoreData

struct EmotionDetailView: View {
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
            
            
        }
        
        
    }
}
