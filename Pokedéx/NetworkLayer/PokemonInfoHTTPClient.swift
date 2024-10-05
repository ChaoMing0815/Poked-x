//
//  PokemonInfoHTTPClient.swift
//  Pokedéx
//
//  Created by 黃昭銘 on 2024/10/3.
//

import Foundation

class PokemonInfoHTTPClient: HTTPClient {
    
    func requestPokemonInfo(with name: String, completion: @escaping (Result<(Data, HTTPURLResponse), HTTPClientError>) -> Void) {
        request(with: makePokemonInfoRequest(with: name), completion: completion)
    }
    
    func requestPokemonImage(with id: String, completion: @escaping (Result<(Data, HTTPURLResponse), HTTPClientError>) -> Void) {
        request(with: makePokemonImageRequest(with: id), completion: completion)
    }
    
    func requestPokemonShinyImage(with id: String, completion: @escaping (Result<(Data, HTTPURLResponse), HTTPClientError>) -> Void) {
        request(with: makePokemonShinyImageRequest(with: id), completion: completion)
    }
}

fileprivate extension PokemonInfoHTTPClient {
    // InfoAPI: https://pokeapi.co/api/v2/pokemon/{name}
    func makePokemonInfoRequest(with name: String) -> RequestType {
        let url = URL.init(string: "https://pokeapi.co/api/v2/")!
        let path = "/pokemon/\(name)"
        return RequestType(httpMethod: .GET, domainURL: url, path: path)
    }
    
    var headers: [String : String] {
            [
                "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36"
            ]
        }
    
    //ImageAPI: https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/{id}.png
    func makePokemonImageRequest(with id: String) -> RequestType {
        let url = URL.init(string: "https://raw.githubusercontent.com")!
        let path = "/PokeAPI/sprites/master/sprites/pokemon/other/home/\(id).png"
        return RequestType.init(httpMethod: .GET, domainURL: url, path: path, headers: headers)
    }
    
    // ShinyImageAPI: https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/{id}.png
    func makePokemonShinyImageRequest(with id: String) -> RequestType {
        let url = URL.init(string: "https://raw.githubusercontent.com")!
        let path = "/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/\(id).png"
        return RequestType.init(httpMethod: .GET, domainURL: url, path: path, headers: headers)
    }
}
