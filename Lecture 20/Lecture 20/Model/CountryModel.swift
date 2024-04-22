//
//  CountryModel.swift
//  Lecture 20
//


import UIKit

struct Country: Codable {
    let name: Name
    let flags: Flags
}

struct Name: Codable {
    let common: String
}

struct Flags: Codable {
    let png: String
}


