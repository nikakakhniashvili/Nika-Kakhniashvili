//
//  NewsView.swift
//  Assignment 28
//
//  Created by Nika Kakhniashvili on 23.05.24.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        HStack {
            VStack {
                Image("personicon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .padding(.top, 20)
                
                Text("ცეცხლოვანი სიახლეები")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .background(
                        Image("purplerectangle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    )
                    .cornerRadius(10)
                    .frame(width: 150)
                    .padding(.leading, 65)
            }
            .padding(.bottom, 25)
            
            Spacer()
            
            HStack {
                Image("megaphone")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding(.trailing, 10)
                    .offset(x: -50)
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: UIScreen.main.bounds.width * 0.45, maxHeight: 150)
        .background(
            Image("purplerectangle")
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
