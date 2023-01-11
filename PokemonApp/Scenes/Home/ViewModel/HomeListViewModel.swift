//
//  HomeListViewModel.swift
//  PokemonApp
//
//  Created by Diego Costa on 10/01/23.
//

import Foundation
import RxSwift
import RxRelay

final class HomeListViewModel: HomeListViewModelProtocol {
    
    private var disposeBag: DisposeBag = .init()
    private let repository: HomeListViewModelRepositoryProtocol
    
    private(set) var result: BehaviorRelay<PokemonResponse> = .init(value: .init())
    
    init(_ repository: HomeListViewModelRepositoryProtocol) {
        self.repository = repository
    }
    
    func loadData() {
        repository.loadPokemons()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] response in
                self?.result.accept(response)
            }, onError: { error in
                print(error)
            }, onCompleted: {
                print("completed")
            }).disposed(by: disposeBag)
    }
}
