//
//  EmotionLineView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/20.
//

import SwiftUI

struct EmotionLineView: View {
    @State var name:String
    @State var emoji:String
    @State var info:String = ""
    
    var body: some View {
        HStack {
            Text(emoji)
                .font(.title)
            
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text(name)
                        .fontWeight(.bold)
                    
                    
                }
                
                Text(info)
                    .lineLimit(2)
            }
            
        }
    }
}
