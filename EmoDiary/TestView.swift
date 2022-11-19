//
//  SwiftUIView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/18.
//

import SwiftUI
import SwiftUIX

struct TestView: View {
    @State var textInput:String = ""
    @State var url:URL = URL(string: "www.baidu.com")!
    
    var body: some View {
        VStack {
            List{
                Text(String("🧏🏻‍♂️".isSingleEmoji))
                Text(String("🧏🏻‍♂️".isSingleEmoji))
                HStack {
                    TextField( "Hint Text", text: $textInput)
                    .textFieldStyle(.plain)
                .autocorrectionDisabled(false)
                    Button {
                        textInput = ""
                    } label: {
                        
                    }

                }
            }

        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
