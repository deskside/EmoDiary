//
//  EmoEachTimeLineView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/21.
//

import SwiftUI

struct RecordLineView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @State var name:String = "Hopeful"
    @State var date:Date = Date()
    @State var emoji:String = "🤩"
    @State var feelings:String = "One of the major problems in SwiftUI is the lack of an imperative presentation/navigation API. This makes implementing complex navigation such as deeplinking and dynamic backend-driven user flows nigh extremely difficult, and in some cases downright impossible. This is where DynamicViewPresenter comes in."
    
    var body: some View {
        HStack {
            Text(emoji)
                .font(.largeTitle)
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text(name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
//                    Text(DateController.dateToString(date: date))
//                        .font(.footnote)
                }
                Text(feelings)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
            }
        }
        .padding(.top, 30)
        .padding(.horizontal, 20)
        .foregroundColor(isDarkMode ? .white : .black)
        
        
    }
}

struct RecordLineView_Previews: PreviewProvider {
    static var previews: some View {
        RecordLineView()
    }
}
