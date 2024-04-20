//
//  NewsAPI.swift
//  Lecture 18
//
//  Created by Nika Kakhniashvili on 20.04.24.
//

import Foundation

struct NewsListResponse: Decodable {
    let List: [NewsArticle]
}

class NewsList {
    func fetchData(completion: @escaping ([NewsArticle]) -> Void) {
        let url = URL(string: "https://imedinews.ge/api/categorysidebarnews/get")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode(NewsListResponse.self, from: data)
                completion(responseData.List)
            } catch {
                print("Failed to parse JSON: \(error)")
            }
        }.resume()
    }
}
