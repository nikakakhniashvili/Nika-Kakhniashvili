//
//  HotelsViewModel.swift
//  Assignment 31
//
//  Created by Nika Kakhniashvili on 30.05.24.
//

import Foundation

class HotelsViewModel: ObservableObject {
    @Published var hotels: [Hotel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchHotels() {
        isLoading = true
        errorMessage = nil

        guard let url = URL(string: "https://mocki.io/v1/7f77e575-c3c2-4950-b662-46178613019e") else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }

        NetworkingService.shared.fetchData(from: url) { [weak self] (result: Result<[Hotel], Error>) in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let hotels):
                    self?.hotels = hotels
                case .failure(let error):
                    self?.errorMessage = "Error fetching hotels: \(error.localizedDescription)"
                }
            }
        }
    }
}
