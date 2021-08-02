//
//  HomeViewController.swift
//  Geliyo
//
//  Created by Oguz Demırhan on 30.07.2021.
//

import UIKit

protocol ProductViewInterface: AnyObject {
    func reloadProducts()
    func prepareNavBar()
    func prepareCollectionView()
    func prepareButtons()
}

class ProductViewController: UIViewController, FilterViewControllerDelegate {
    //MARK:- Delegate Function
    
    func didUpdateFilter(filter: String) {
        presenter.update(with: filter)
    }
    
    var presenter: ProductPresenterInterface!
    let searchController = UISearchController()
    var collectionView: UICollectionView!
    let stackView = UIStackView()
    let orderButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.tintColor = .lightGray
        button.setImage(UIImage(systemName: "list.triangle"), for: .normal)
        button.setTitle("Sırala", for: .normal)
        button.makeShadowButtonWithRadius(height: 57)
        button.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
        return button
    }()
    
    let filterButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.tintColor = .lightGray
        button.setImage(UIImage(named: "filter"), for: .normal)
        button.setTitle("Filtre", for: .normal)
        button.makeShadowButtonWithRadius(height: 57)
        button.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner]
        return button
    }()
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}
// MARK:- Button Setups
extension ProductViewController{
    
    @objc func filterButtonAction(){
        let filterVC = FilterViewController()
        filterVC.delegate = self
        present(filterVC, animated: true, completion: nil)
    }
}
//MARK:- Create Layout
extension ProductViewController {
    
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.611))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0) , heightDimension: .absolute(218))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item,count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 21, bottom: 0, trailing: 21)
        group.interItemSpacing = .fixed(14)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.interGroupSpacing = 16
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
//MARK:- CollectionViewDataSource
extension ProductViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfProducts
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.reuseIdentifier, for: indexPath) as! ProductCollectionViewCell
        cell.configure(image: presenter.productForIndex(indexPath.item).image, title: presenter.productForIndex(indexPath.item).title, price: String(presenter.productForIndex(indexPath.item).price))
        
        return cell
    }
}
extension ProductViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.selectProduct(at: indexPath.item)
    }
}

extension ProductViewController: ProductViewInterface {
    
    func prepareButtons() {
        
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderButton.heightAnchor.constraint(equalToConstant: 57)
        ])

        NSLayoutConstraint.activate([
            filterButton.heightAnchor.constraint(equalToConstant: 57)
        ])
        
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 0
        stackView.addArrangedSubview(orderButton)
        stackView.addArrangedSubview(filterButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,constant: 21),
            stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -21),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 24)
        ])
        filterButton.addTarget(self, action: #selector(filterButtonAction), for: .touchUpInside)
    }
    
    func reloadProducts() {
        collectionView.reloadData()
    }
    
    func prepareNavBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func prepareCollectionView() {
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(UINib.loadNib(name: ProductCollectionViewCell.reuseIdentifier), forCellWithReuseIdentifier: ProductCollectionViewCell.reuseIdentifier)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor,constant: 30)
        ])
    }
}

