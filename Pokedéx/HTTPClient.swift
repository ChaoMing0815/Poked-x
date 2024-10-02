//
//  HTTPClient.swift
//  Pokedéx
//
//  Created by 黃昭銘 on 2024/10/3.
//

import Foundation

enum HTTPClientError: Error {
    case NetworkError
    case DataNilAndResponseError
}

class HTTPClient {
    let urlSession = URLSession.shared
   
    func request(with requestType: RequestType, completion: @escaping (Result<(Data, HTTPURLResponse), HTTPClientError>) -> Void) {
        urlSession.dataTask(with: requestType.getURLRequest()) { data, response, error in
            if let _ = error {
                completion(.failure(.NetworkError))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  let data = data else {
                completion(.failure(.DataNilAndResponseError))
                return
            }
            completion(.success((data, response)))
        }.resume()
    }
}
