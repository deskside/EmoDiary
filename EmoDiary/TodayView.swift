//
//  TodayView.swift
//  EmoDiary
//
//  Created by Joey Xie on 2022/11/15.
//

import SwiftUI

struct TodayView: View {
    @State private var showingAlerts = true
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVStack{
                    ZStack(alignment: .bottomTrailing) {
                        Image("mountain")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .ignoresSafeArea()
                        
                        
                        Image("avatar")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: 75, height: 75)
                            .padding()
                            .offset(x: 0, y: 30)
                    }
                    
                    NavigationLink {
                        TestView()
                    } label: {
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
                    
                    
                    
                    
                    Spacer()
                    
                }
            }
            .background(.secondarySystemBackground)
        .ignoresSafeArea()
        }
        
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
