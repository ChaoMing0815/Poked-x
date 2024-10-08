//
//  AllPokemonListHTTPClient.swift
//  Pokedéx
//
//  Created by 黃昭銘 on 2024/10/3.
//

import Foundation

class AllPokemonListHTTPClient: HTTPClient {
    
    func requestAllPokemon(completion: @escaping (Result<(Data, HTTPURLResponse), HTTPClientError>) -> Void) {
        request(with: allPokemonListRequestType, completion: completion)
    }
}

extension AllPokemonListHTTPClient {
    // https://pokeapi.co/api/v2/pokemon?limit=1302
    var allPokemonListRequestType: RequestType {
        return RequestType(httpMethod: .GET, domainURL: .init(string: "https://pokeapi.co/api/v2")!, path: "/pokemon", queryItem: [.init(name: "limit", value: "1302")])
    }
}
