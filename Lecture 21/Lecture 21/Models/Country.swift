//
//  Country.swift
//  Lecture 21
//

import Foundation

struct Country {
    
    let capital: String
    let region: String
    let subregion: String
    let area: Int
    let continents: String
    let startOfWeek: String
    let name: Name
    let flags: Flags
    
    var imageURL: URL? {
        return URL(string: "https://flagcdn.com/w320/ge.png")
    }
    
    struct Name {
        let common: String
    }
    
    struct Flags {
        let alt: String
    }
    
    struct Image {
        let png: String
    }
}

extension Country {
    
    public static func getMockArray() -> [Country] {
        return [
            Country(capital: "Tbilisi", region: "Tbilisi", subregion: "Kartli", area: 10, continents: "Europe", startOfWeek: "Monday", name: Name(common: "Georgia"), flags: Flags(alt: "Red and White"))
        ]
    }
    
}
