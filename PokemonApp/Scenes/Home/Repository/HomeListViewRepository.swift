//
//  HomeListViewRepository.swift
//  PokemonApp
//
//  Created by Diego Costa on 10/01/23.
//

import Foundation
import RxSwift

final class HomeListViewRepository: HomeListViewModelRepositoryProtocol {
    
    func loadPokemons() -> Observable<PokemonResponse> {
        let requestable = HomeListPokemonsRequestable()
        let request: HTTPRequest<PokemonResponse> = .init(requestable)
        return request.fetch()
    }
    
    func loadMorePokemons(next page: String) -> Observable<PokemonResponse> {
        let requestable = HomeListMorePokemonsRequestable(page: page)
        let request: HTTPRequest<PokemonResponse> = .init(requestable)
        return request.fetch()
    }
}
