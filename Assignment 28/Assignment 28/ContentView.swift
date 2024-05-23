//
//  ContentView.swift
//  Assignment 28
//
//  Created by Nika Kakhniashvili on 23.05.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("svibti iuai eksersaisi")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.leading, 30)
                .padding(.top, 10)
            
            HStack {
                VStack {
                    MusicView()
                }
                
                Spacer()
                
                VStack {
                    ChatView()
                    NewsView()
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            ListView()
                .padding(.top, -30)
        }
        .background(
            Image("appbackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

#Preview {
    ContentView()
}

