//
//  CollectionViewExtension.swift
//  PokemonApp
//
//  Created by Diego Costa on 10/01/23.
//

import UIKit

extension UICollectionView {

    func register<T: UICollectionViewCell>(_ type: T.Type) {
        register(T.classForCoder(), forCellWithReuseIdentifier: String(describing: type))
    }
    
    func dequeue<T: UICollectionViewCell>(cell: T.Type, indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: String(describing: cell), for: indexPath) as? T
    }
}

extension UICollectionViewCell {

    static var identifier: String {
        return String(describing: self)
    }
}

