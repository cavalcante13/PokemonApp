//
//  HomeListViewModelRepository.swift
//  PokemonApp
//
//  Created by Diego Costa on 10/01/23.
//

import Foundation
import RxSwift

protocol HomeListViewModelRepositoryProtocol {
    func loadPokemons() -> Observable<PokemonResponse>
    func loadMorePokemons(next page: String) -> Observable<PokemonResponse>
}
