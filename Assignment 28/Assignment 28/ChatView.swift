//
//  ChatView.swift
//  Assignment 28
//
//  Created by Nika Kakhniashvili on 23.05.24.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        HStack {
            VStack {
                Image("chaticon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                
                Text("ჩატაობა")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Image("orangerectangle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    )
                    .cornerRadius(10)
                    .frame(width: 120)
                    .padding(.leading, 30)
            }
            .padding(.bottom, 25)
            
            Spacer()
            
            HStack {
                Spacer()
                
                Image("chatsymbol")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding(.trailing, 10)
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: UIScreen.main.bounds.width * 0.45, maxHeight: 150)
        .background(
            Image("orangerectangle")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .cornerRadius(10)
        .padding(.trailing)
    }
}

#Preview {
    ContentView()
}
