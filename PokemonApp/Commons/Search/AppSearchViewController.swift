//
//  AppSearchViewController.swift
//  PokemonApp
//
//  Created by Diego Costa on 10/01/23.
//
import UIKit

class AppSearchViewController: UISearchController {
    
    init(placeholder: String) {
        super.init(searchResultsController: nil)
        searchBar.placeholder = placeholder
        prepareLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareLayout() {
        obscuresBackgroundDuringPresentation = false
        searchBar.searchBarStyle   = .minimal
        searchBar.barTintColor     = .darkGray
        searchBar.tintColor        = .darkGray
        searchBar.isTranslucent    = false
        searchBar.returnKeyType    = .search
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.setValue("Cancelar", forKey: "cancelButtonText")
        searchBar.sizeToFit()
    }
}
