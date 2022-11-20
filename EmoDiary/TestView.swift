//
//  SwiftUIView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/18.
//

import SwiftUI
import SwiftUIX

struct TestView: View {
    @State var image: Data?
    
    var body: some View {
        VStack {
            ImagePicker(data: $image, encoding: .png, onCancel: { })
            
            if let image = image {
                Image(data: image)?
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200,height: 200)
                    .clipped()
            }
        }
        
    }
}
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

