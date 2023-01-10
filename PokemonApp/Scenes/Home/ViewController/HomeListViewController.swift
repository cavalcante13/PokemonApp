//
//  HomeListViewController.swift
//  PokemonApp
//
//  Created by Diego Costa on 10/01/23.
//

import UIKit

final class HomeListViewController: UIViewController {

    private let viewModel: HomeListViewModelProtocol
    
    init(_ viewModel: HomeListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.loadData()
    }
}
