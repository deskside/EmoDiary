//
//  SwiftUIView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/18.
//

import SwiftUI
import SwiftUIX

struct TestView: View {
    @State var minAge = 20
    @State var url:URL = URL(string: "www.baidu.com")!
    
    var body: some View {
        VStack {
                    
                }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
