//
//  HTTPRequestDecoder.swift
//  PokemonApp
//
//  Created by Diego Costa on 10/01/23.
//

import Foundation

final class HTTPRequestDecoder: JSONDecoder {
    
    override init() {
        super.init()
        self.keyDecodingStrategy = .convertFromSnakeCase
    }
}
