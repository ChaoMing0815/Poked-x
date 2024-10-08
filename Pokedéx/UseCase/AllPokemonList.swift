//
//  AllPokemonList.swift
//  Pokedéx
//
//  Created by Judy Tsai on 2024/10/2.
//

import Foundation

struct AllPokemonList {
    var allPokemonInfos: [SinglePokemonInfo] {
        allPokemonLitsDTO.results.compactMap {
            if let id = self.extractLastNumber(from: $0.url) {
                return SinglePokemonInfo.init(name: $0.name, id: id)
            }
            return nil
        }
    }
    
    private let allPokemonLitsDTO: AllPokemonListDTO
    
    init(from dto: AllPokemonListDTO) {
        allPokemonLitsDTO = dto
    }
    
    private func extractLastNumber(from url: String) -> String? {
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return nil
        }
        
        let pathComponents = url.pathComponents
        let nonEmptyComponents = pathComponents.filter { !$0.isEmpty }
        guard let lastNumberString = nonEmptyComponents.last else {
            print("No numeric component found in URL")
            return nil
        }
        guard let idNumber = Int(lastNumberString) else {
            print("Can not convert lastNumberString to Int!")
            return nil
        }
        return String(describing: idNumber)
    }
}
