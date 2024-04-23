//
//  CountryService.swift
//  Lecture 20
//

import Foundation

class CountryService {
    func fetchCountries(completion: @escaping ([Country]?) -> Void) {
        let url = URL(string: "https://restcountries.com/v3.1/all")!
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                completion(countries)
            } catch {
                print("Error decoding country data: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
