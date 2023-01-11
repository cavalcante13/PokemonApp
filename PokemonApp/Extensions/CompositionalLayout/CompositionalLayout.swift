//
//  CompositionalLayout.swift
//  PokemonApp
//
//  Created by Diego Costa on 10/01/23.
//

import UIKit

struct CompositionalLayout {
    
    static func layout(_ section: CompositionalLayoutSection) -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout.init { index, _ in
            switch section {
            case .pokemons:
                return CompositionalLayout.gridLayout()
            }
        }
        return layout
    }

    private static func gridLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(300))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 4, bottom: 0.0, trailing: 4)
        return section
    }
    
    private static func carouselLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 8, leading: 4, bottom: 8, trailing: 4)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.90), heightDimension: .absolute(200))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return section
    }
    
}
   
