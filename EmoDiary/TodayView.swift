//
//  TodayView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/15.
//

import SwiftUI

struct TodayView: View {
    @State private var showingAlerts = true
    
    var body: some View {
        HStack {
            Image(systemName: "person.3.sequence.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(
                    .linearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottomTrailing),
                    .linearGradient(colors: [.green, .black], startPoint: .top, endPoint: .bottomTrailing),
                    .linearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottomTrailing)
                )
            .font(.largeTitle)
            
            Image(systemName: "bell")
                .symbolVariant(.slash)
            Image(systemName: "bell")
                .symbolVariant(.square)
            
            Toggle(isOn: $showingAlerts) {
                        Label("Show Alerts", systemImage: "bell")
                            .symbolVariant(showingAlerts ? .none : .slash)
                    }
            .toggleStyle(.button)

        }

    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
