//
//  MusicView.swift
//  Assignment 28
//
//  Created by Nika Kakhniashvili on 23.05.24.
//

import SwiftUI

struct MusicView: View {
    var body: some View {
        VStack {
            HStack {
                ZStack(alignment: .topLeading) {
                    Image("guitar")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width * 0.45, height: 310)
                        .cornerRadius(20)
                        .clipped()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Image("microphone")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding([.top, .leading], 10)
                        
                        Spacer()
                        
                        Text("We love property wrappers\nand closures")
                            .foregroundColor(.white)
                            .padding([.leading, .bottom], 15)
                            .cornerRadius(5)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.45 - 20, height: 300)
                }
                Spacer()
            }
            Spacer()
        }
        .padding(.leading)
    }
}

#Preview {
    ContentView()
}

