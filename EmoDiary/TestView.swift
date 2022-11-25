//
//  SwiftUIView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/18.
//

import SwiftUI
import SwiftUIX
import NVMColor
import CoreData

struct TestView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    let hexColor = Color.init(hexadecimal: "70049F").hex
    var color1:Color{
        var hexColor = Color.init(hexadecimal: "70049F").hex
        return Color(hexadecimal: hexColor ?? "")
        
    }
    
    var body: some View {
        
        
        
        Text("My custom text")
                    .foregroundColor(Color(hex: "70049F")!.themedColor(colorScheme))
            }
        

        
    
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

