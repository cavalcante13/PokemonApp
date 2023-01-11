//
//  HomeListPokemonsRequestable.swift
//  PokemonApp
//
//  Created by Diego Costa on 11/01/23.
//

import Foundation

final class HomeListPokemonsRequestable: HTTPRequestable {
    
    init() {}
    
    var path: String {
        return "pokemon"
    }
}
