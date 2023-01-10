//
//  ViewConfigurator.swift
//  PokemonApp
//
//  Created by Diego Costa on 10/01/23.
//

import UIKit

protocol ViewConfigurator: AnyObject {
    func setup()
    func prepareViews()
    func addViewHierarchy()
    func setupConstraints()
    func configureViews()
    func bindingViews()
}

extension ViewConfigurator {
    func setup() {
        prepareViews()
        addViewHierarchy()
        setupConstraints()
        configureViews()
        bindingViews()
    }
}
