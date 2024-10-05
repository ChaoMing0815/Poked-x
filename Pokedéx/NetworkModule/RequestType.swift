//
//  RequestType.swift
//  Pokedéx
//
//  Created by 黃昭銘 on 2024/10/2.
//

import Foundation

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
}

class RequestType {
    let httpMethod: HTTPMethod
    let domainURL: URL
    let path: String
    let queryItem: [URLQueryItem]
    let body: Data?
    let headers: [String: String]?
    
    init(httpMethod: HTTPMethod, domainURL: URL, path: String, queryItem: [URLQueryItem] = [], body: Data? = nil, headers: [String : String]? = nil) {
        self.httpMethod = httpMethod
        self.domainURL = domainURL
        self.path = path
        self.queryItem = queryItem
        self.body = body
        self.headers = headers
    }
}

// MARK: - Helpers
private
extension RequestType {
    func getFullURL() -> URL {
        var urlComponents = URLComponents(url: domainURL, resolvingAgainstBaseURL: false)
        urlComponents?.path += path
        if !queryItem.isEmpty {
            urlComponents?.queryItems = queryItem
        }
        guard let url = urlComponents?.url else {
            fatalError("URL should not be nil")
            // TODO: Error handling
        }
        return url
    }
}

// MARK: - Internal Methods
extension RequestType {
    func getURLRequest() -> URLRequest {
        let fullURL = getFullURL()
        var request = URLRequest(url: fullURL)
        request.httpMethod = httpMethod.rawValue
        if let body = body {
            request.httpBody = body
        }
        if let headers = headers {
            for (headerField, headerValue) in headers {
                request.setValue(headerValue, forHTTPHeaderField: headerField)
            }
        }
        return request
    }
}
