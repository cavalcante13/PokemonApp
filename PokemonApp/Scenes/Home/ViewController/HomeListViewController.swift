//
//  HomeListViewController.swift
//  PokemonApp
//
//  Created by Diego Costa on 10/01/23.
//

import UIKit
import RxSwift
import SnapKit

final class HomeListViewController: ViewController {
    private var searchController = AppSearchViewController(placeholder: "Pesquise pelo nome do pokemon")
    private var collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: .init())
    private var datasource: CompositionalLayoutDatasource?
    private var snapshot: CompositionalLayoutSnapshot = .init()
    private var disposeBag: DisposeBag = .init()
    private let viewModel: HomeListViewModel
    
    init(_ viewModel: HomeListViewModel) {
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
        navigationItem.title = "PokemonApp"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        viewModel.loadData()
    }
    
    override func addViewHierarchy() {
        view.addSubview(collectionView)
    }
    
    override func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    override func configureViews() {
        configureDatasource()
        configureCollectionView()
    }
    
    override func bindingViews() {
        searchController.searchBar.rx.text
            .subscribe(onNext: { [weak self] text in
                print(text)
            })
            .disposed(by: disposeBag)
        
        viewModel.result.subscribe(onNext: { [weak self] response in
            self?.snapshot.appendItems(response.results, toSection: .pokemons)
            self?.dataSourceApply()
        }, onError: { error in
            print(error)
        }).disposed(by: disposeBag)
    }
    
    private func configureDatasource() {
        if !snapshot.sectionIdentifiers.contains(.pokemons) {
            snapshot.appendSections([.pokemons])
        }
        
        datasource = .init(collectionView: collectionView, cellProvider: { [weak self] collectionView, indexPath, item in
            return self?.cell(collectionView: collectionView, indexPath: indexPath, item: item)
        })
    }
    
    private func dataSourceApply() {
        datasource?.apply(snapshot, animatingDifferences: true, completion: nil)
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.collectionViewLayout = CompositionalLayout.layout(.pokemons)
        collectionView.register(HomeListCollectionViewCell.self)
    }

    private func cell(collectionView: UICollectionView, indexPath: IndexPath, item: PokemonResponse.Result) -> UICollectionViewCell? {
        let cell = collectionView.dequeue(cell: HomeListCollectionViewCell.self, indexPath: indexPath)
        cell?.set(item)
        return cell ?? .init()
    }
}
extension HomeListViewController: UICollectionViewDelegate {
    
}
