//
//  DestinationViewModel.swift
//  Assignment 31
//
//  Created by Nika Kakhniashvili on 30.05.24.
//

import Foundation

class DestinationViewModel: ObservableObject {
    @Published var destinations: [Destination] = [
        Destination(name: "London", country: "United Kingdom", imageName: "London", description: "A bustling city with rich history."),
        Destination(name: "Paris", country: "France", imageName: "Paris", description: "The city of light and love."),
        Destination(name: "Tokyo", country: "Japan", imageName: "Tokyo", description: "A vibrant city blending tradition and modernity."),
        Destination(name: "Berlin", country: "Germany", imageName: "Berlin", description: "A city with a turbulent history and a vibrant culture."),
        Destination(name: "Washington", country: "United States", imageName: "Washington", description: "The capital city of the USA."),
        Destination(name: "Prague", country: "Czech Republic", imageName: "Prague", description: "A historical city known for its old town and castles."),
        Destination(name: "Stockholm", country: "Sweden", imageName: "Stockholm", description: "A beautiful city spread across many islands."),
        Destination(name: "Tbilisi", country: "Georgia", imageName: "Tbilisi", description: "The capital city of Georgia with unique architecture."),
        Destination(name: "Madrid", country: "Spain", imageName: "Madrid", description: "The capital city of Spain known for its art and culture."),
        Destination(name: "Vienna", country: "Austria", imageName: "Vienna", description: "The capital city of Austria known for its musical heritage.")
    ]
}



