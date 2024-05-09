//
//  Endpoint.swift
//  PhotosApp
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var query: String { get }
}

extension Endpoint {
    var authHeader: String {
        return API.key
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base) ?? URLComponents()
        components.path = path
        components.query = query
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url ?? URL(string: "")!
        var request = URLRequest(url: url)
        request.setValue(authHeader, forHTTPHeaderField: "Authorization")
        return request
    }
}
