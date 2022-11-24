//
//  EmoEachTimeLineView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/21.
//

import SwiftUI

struct EmoEachTimeLineView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    
    var body: some View {
        HStack {
            Text("🤩")
                .font(.largeTitle)
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text("Hopeful")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Text("2022-11-19 12:16")
                        .font(.footnote)
                }
                Text("One of the major problems in SwiftUI is the lack of an imperative presentation/navigation API. This makes implementing complex navigation such as deeplinking and dynamic backend-driven user flows nigh extremely difficult, and in some cases downright impossible. This is where DynamicViewPresenter comes in.")
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
            }
        }
        .padding(.top, 30)
        .padding(.horizontal, 20)
        .foregroundColor(isDarkMode ? .white : .black)
        
        
    }
}

struct EmoEachTimeLineView_Previews: PreviewProvider {
    static var previews: some View {
        EmoEachTimeLineView()
    }
}
