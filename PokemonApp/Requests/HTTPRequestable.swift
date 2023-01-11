//
//  HTTPRequestable.swift
//  PokemonApp
//
//  Created by Diego Costa on 10/01/23.
//

import Foundation

protocol HTTPRequestable {
    var path: String { get }
    var query: String { get }
    var headers: [String: String] { get }
}

extension HTTPRequestable {
    var query: String {
        return ""
    }
    var headers: [String: String] {
        return [:]
    }
}
