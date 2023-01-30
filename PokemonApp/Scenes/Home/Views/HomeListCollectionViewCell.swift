//
//  HomeListCollectionViewCell.swift
//  PokemonApp
//
//  Created by Diego Costa on 10/01/23.
//

import UIKit
import Kingfisher

final class HomeListCollectionViewCell: CollectionViewCell {
    
    private var containerView: UIView = .init()
    private var imageView: UIImageView = .init()
    private var nameLabel: UILabel = .init()
    private var pokemon: PokemonResponse.Result?
    
    override func addViewHierarchy() {
        contentView.addSubview(containerView)
        contentView.addSubview(nameLabel)
        containerView.addSubview(imageView)
    }
    
    override func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8).priority(.low)
        }
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(16)
        }
    }
    
    override func configureViews() {
        configureContainerView()
        configureImageView()
        configureNameLabel()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
    
    func set(_ pokemon: PokemonResponse.Result) {
        self.pokemon = pokemon
        self.nameLabel.text = pokemon.name
        self.imageView.kf.setImage(with: pokemon.imgUrl)
    }
    
    private func configureContainerView() {
        containerView.backgroundColor = #colorLiteral(red: 0.9490196109, green: 0.9490197301, blue: 0.9490196109, alpha: 1)
        containerView.layer.cornerRadius = 8
    }
    
    private func configureImageView() {
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
    }
    
    private func configureNameLabel() {
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .left
        nameLabel.textColor = #colorLiteral(red: 0.1921568811, green: 0.1921568811, blue: 0.1921568811, alpha: 1)
        nameLabel.font = .boldSystemFont(ofSize: 18)
    }
}
