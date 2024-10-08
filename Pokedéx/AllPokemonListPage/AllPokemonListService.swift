//
//  AllPokemonListService.swift
//  Pokedéx
//
//  Created by 黃昭銘 on 2024/10/3.
//

import Foundation

enum AllPokemonListServiceError: Error {
    case NetworkError
    case JSONParsingError
}

class AllPokemonListService {
    let allPokemonListClient = AllPokemonListHTTPClient()
    let pokemonInfoClient = PokemonInfoHTTPClient()
    
    func loadAllPokemonList(completion: @escaping (Result<[AllPokemonListDTO], AllPokemonListServiceError>) -> Void) {
        allPokemonListClient.requestAllPokemon { [weak self] results in
            guard let self else { return }
            DispatchQueue.main.async {
                switch results {
                case let .success((data, _)):
                    do {
                        let allPokemonListDTO = try JSONDecoder().decode(AllPokemonListDTO.self, from: data)
                        completion(.success([allPokemonListDTO]))
                    } catch {
                        completion(.failure(.JSONParsingError))
                    }
                case .failure:
                    completion(.failure(.NetworkError))
                }
            }
        }
    }
    
    func loadPokemonImage(with id: String, completion: @escaping (Result<Data, AllPokemonListServiceError>) -> Void) {
        pokemonInfoClient.requestPokemonInfo(with: id) { [weak self] results in
            guard let self else { return }
            DispatchQueue.main.async {
                switch results {
                case let .success((imageData, _)):
                    completion(.success(imageData))
                case .failure(_):
                    completion(.failure(.NetworkError))
                }
            }
        }
    }
}
