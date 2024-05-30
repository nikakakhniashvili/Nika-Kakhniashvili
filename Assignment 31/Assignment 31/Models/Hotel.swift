//
//  Hotel.swift
//  Assignment 31
//
//  Created by Nika Kakhniashvili on 30.05.24.
//

import Foundation

struct Hotel: Decodable, Identifiable {
    let id = UUID() // Generate a unique ID for each hotel
    let name: String
    let city: String
    let country: String
}
