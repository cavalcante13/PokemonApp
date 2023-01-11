//
//  PokemonResponse.swift
//  PokemonApp
//
//  Created by Diego Costa on 10/01/23.
//

import Foundation

struct PokemonResponse: Codable {
    var count: Int = 0
    var next: String?
    var previous: String?
    var results: [PokemonResponse.Result] = []
}

extension PokemonResponse {
    struct Result: Codable, Hashable {
        var name: String?
        var url: String?
    }
}
