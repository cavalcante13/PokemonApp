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
        var id: Int? {
            guard let id = url?.split(separator: "/").last else { return nil }
            return Int(String(id))
        }
        var imgUrl: URL? {
            guard let identifier = id else {
                return nil
            }
            let string = String(format: "%03d", identifier)
            return URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/\(string).png")
        }
    }
}
