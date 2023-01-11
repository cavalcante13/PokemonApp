//
//  Typealias.swift
//  PokemonApp
//
//  Created by Diego Costa on 10/01/23.
//
import UIKit
import Foundation

typealias CompositionalLayoutDatasource = UICollectionViewDiffableDataSource<CompositionalLayoutSection, PokemonResponse.Result>
typealias CompositionalLayoutSnapshot = NSDiffableDataSourceSnapshot<CompositionalLayoutSection, PokemonResponse.Result>
