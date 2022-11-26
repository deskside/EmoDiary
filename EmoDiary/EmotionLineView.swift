//
//  EmotionLineView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/20.
//

import SwiftUI

struct EmotionLineView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var emotion:Emotion
    

    
    var body: some View {
        
        HStack {
            ZStack{
                
                
                Circle()
                    .frame(max: CGSize(width: 50, height: 50))
                    .foregroundColor(emotion.wrappedColor)
                    
                
                Text(emotion.wrappedEmoji)
                    .font(.title)
                
            }
            
                
                
            
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text(emotion.wrappedName)
                        .fontWeight(.bold)
                    
                    
                }
                
                Text(emotion.wrappedInfo)
                    .lineLimit(2)
            }
            
        }
        
    }
}
