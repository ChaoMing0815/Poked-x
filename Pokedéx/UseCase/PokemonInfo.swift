//
//  PokemonInfo.swift
//  Pokedéx
//
//  Created by Judy Tsai on 2024/10/2.
//

import Foundation

struct PokemonInfo {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    var imageData: Data?
    
//    init(from dto: PokemonInfoDTO) {
//        id = dto.id
//        name = dto.name
//        height = dto.height
//        weight = dto.weight
//    }
}

//struct PokemonInfoDTO: Codable {
//    let id: Int
//    let name: String
//    let height: Int
//    let weight: Int
//}
