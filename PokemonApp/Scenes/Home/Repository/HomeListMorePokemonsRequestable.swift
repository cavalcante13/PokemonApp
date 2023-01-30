//
//  HomeListMorePokemonsRequestable.swift
//  PokemonApp
//
//  Created by Diego Costa on 11/01/23.
//

import Foundation

final class HomeListMorePokemonsRequestable: HTTPRequestable {
    
    var page: String
    
    init(page: String) {
        self.page = page
    }
    var path: String {
        return page
    }
}
