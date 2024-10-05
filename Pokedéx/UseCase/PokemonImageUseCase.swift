//
//  PokemonImageUseCase.swift
//  Pokedéx
//
//  Created by Judy Tsai on 2024/10/2.
//

import Foundation

enum PokemonImageUseCaseError: Error {
    case parsingError
}

protocol PokemonImageUseCaseProtocol {
    func loadPokemonImage(with id: String, completion: @escaping (Result<Data, PokemonImageUseCaseError>) -> Void)
}

class PokemonImageUseCase: PokemonImageUseCaseProtocol {
    
    func loadPokemonImage(with id: String, completion: @escaping (Result<Data, PokemonImageUseCaseError>) -> Void) {
        
    }
}


