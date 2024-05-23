//
//  ListView.swift
//  Assignment 28
//
//  Created by Nika Kakhniashvili on 23.05.24.
//

import SwiftUI

struct ListView: View {
    let articles = [
        Article(title: "რა დაუწუნა ბარბარემ ნიკის?", text: "ნიკის ამაზე ჯერ განცხადება არ გაუკეთებია, ფანები ელოდებიან რომ რომელიმე მალე სიჩუმეს გაფანტავს."),
        Article(title: "რა ზომის ფეხი აქვს ვასოს?", text: "დეველოპერებმა განაცხადეს რომ თუ მას 42 და მეტი ზომა ფეხი აქვს მის მოსმენას აზრი არ აქვს და კომენტარის გარეშე დატოვებენ ლექციას."),
        Article(title: "რა სიმაღლისაა ანჟელა ew?", text: "ანჟელა ew არის მეტრაოთხმოცი, რაც ნიშნავს რომ ის დაახლოებით ტეილორ Swift-ის სიმაღლისაა და დიდი ფეხი აქვს."),
        Article(title: "რატომ გაებუტა ბარბარეს ჭეპეტე?", text: "ამჟამინდელი მონაცემებით ისინი 2 დღე არ ესაუბრებოდნენ ერთმანეთს და როგორც გაირკვა ანიგნორებს აიგნორებდნენ რაღაც იგნორში."),
        Article(title: "MVC vs MVVM", text: "აი ეს MVC გასაგებია, მაგრამ MVVM ჩემამდე არ დადის რა, ამ სვიბთ იუაიში სად ვიყენებთ მაგას?"),
        Article(title: "ნეტავ რამდენი ხანი გაგრძელდება ეს?", text: "აღმოჩნდა რომ დეველოპერები ძალიან გახარებულები არიან SwiftUI-ით. ნეტავ რამდენი ხანი გაგრძელდება Honeymoon phase?")
    ]
    
    var body: some View {
        List(articles, id: \.title) { article in
            HStack(spacing: 10) {
                Image("articleicon")
                    .resizable()
                    .frame(width: 40, height: 40)
                
                VStack(alignment: .leading) {
                    Text(article.title)
                        .fontWeight(.bold)
                    Text(article.text)
                        .font(.caption)
                        .lineLimit(3)
                }
            }
        }
        .listStyle(PlainListStyle())
        .padding(.horizontal)
    }
}

struct Article: Identifiable {
    var id = UUID()
    var title: String
    var text: String
}

#Preview {
    ContentView()
}
