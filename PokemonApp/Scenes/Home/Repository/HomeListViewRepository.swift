//
//  HomeListViewRepository.swift
//  PokemonApp
//
//  Created by Diego Costa on 10/01/23.
//

import Foundation
import RxSwift

final class HomeListViewRepository: HomeListViewModelRepositoryProtocol {
    
    var path: String = "pokemon"
    
    init() {}
    
    func loadPokemons() -> Observable<PokemonResponse> {
        let request: HTTPRequest<PokemonResponse> = .init(self)
        return request.fetch()
    }
}
