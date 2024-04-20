//
//  NewsItem.swift
//  Lecture 18
//
//  Created by Nika Kakhniashvili on 20.04.24.
//

import UIKit

struct NewsArticle: Decodable {
    let title: String
    let time: String
    let url: String?
    let type: Int?
    let photoUrl: String
    let photoAlt: String?
    
    // CodingKeys to map JSON keys to Swift properties if they're different
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case time = "Time"
        case url = "Url"
        case type = "Type"
        case photoUrl = "PhotoUrl"
        case photoAlt = "PhotoAlt"
    }
}
