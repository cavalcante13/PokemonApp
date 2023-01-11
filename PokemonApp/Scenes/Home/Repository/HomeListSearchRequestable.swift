//
//  HomeListSearchRequestable.swift
//  PokemonApp
//
//  Created by Diego Costa on 11/01/23.
//

import Foundation

final class HomeListSearchRequestable: HTTPRequestable {
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    var path: String {
        return "pokemon/" + text
    }
}
