//
//  IconStringOneLineView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/17.
//

import SwiftUI

struct IconTextOneLineView: View {
    @State var icon:String
    @State var text:String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(text)
        }
    }
}

struct IconStringOneLineView_Previews: PreviewProvider {
    static var previews: some View {
        IconTextOneLineView(icon: "square.and.arrow.down.on.square.fill", text: "Something")
    }
}
