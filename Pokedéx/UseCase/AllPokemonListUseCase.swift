//
//  UseCase.swift
//  Pokedéx
//
//  Created by Judy Tsai on 2024/10/2.
//

import Foundation

enum AllPokemonListUseCaseError: Error {
    case networkError
    case parsingError
}

protocol AllPokemonListUseCaseProtocol {
    func loadAllPokemonList(completion: @escaping (Result<AllPokemonList, AllPokemonListUseCaseError>) -> Void)
}

class AllPokemonListUseCase: AllPokemonListUseCaseProtocol {
    
    let service: AllPokemonListService
    
    init(service: AllPokemonListService) {
        self.service = service
    }
    
    func loadAllPokemonList(completion: @escaping (Result<AllPokemonList, AllPokemonListUseCaseError>) -> Void) {
        service.loadAllPokemonList { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let allPokemonListDTO):
                let allPokemonList = AllPokemonList(from: allPokemonListDTO)
                completion(.success(allPokemonList))
                
            case .failure(let error):
                switch error {
                case NetworkError:
                    completion(.failure(.networkError))
                case JSONParsingError:
                    completion(.failure(.parsingError))
                }
            }
        }
    }
}


