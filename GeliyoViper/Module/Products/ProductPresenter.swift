//
//  ProductPresenter.swift
//  GeliyoViper
//
//  Created by Oguz Demırhan on 2.08.2021.
//

import Foundation

protocol ProductPresenterInterface {
    func viewDidLoad()
    func productForIndex(_ indexPath: Int) -> ProductModel
    var numberOfProducts: Int{ get }
    func update(with filter: String)
    func selectProduct(at indexPath: Int)
}

final class ProductPresenter {
    weak var view: ProductViewInterface?
    private let interactor: ProductInteractorInterface
    private let router: ProductRouterInterface
    private var PRODUCTS = ProductModels()
    
    init(view: ProductViewInterface?, interactor: ProductInteractorInterface, router: ProductRouterInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    private func fetchRequest(){
        interactor.fetchProducts()
    }
}

extension ProductPresenter: ProductPresenterInterface {
    func selectProduct(at indexPath: Int) {
        let product = PRODUCTS[indexPath]
        self.router.navigateToVC(name: product.title, image: product.image, price: String(product.price),description: product.description)
    }
    
    func update(with filter: String) {
        Service.shared.fetchProducts { products in
            
            self.PRODUCTS = products
            var filteredProducts = ProductModels()
            switch filter {
            case "Men's Clothing":
                self.PRODUCTS.forEach { product in
                    if product.category == "men's clothing" {
                        filteredProducts.append(product)
                    }
                }
            case "Women's Clothing":
                self.PRODUCTS.forEach { product in
                    if product.category == "women's clothing" {
                        filteredProducts.append(product)
                    }
                }
            case "Electronics":
                self.PRODUCTS.forEach { product in
                    if product.category == "electronics" {
                        filteredProducts.append(product)
                    }
                }
            default:
                self.PRODUCTS.forEach { product in
                    if product.category == "jewelery" {
                        filteredProducts.append(product)
                    }
                }
            }
            
            self.PRODUCTS = filteredProducts
            
            DispatchQueue.main.async {
                self.view?.reloadProducts()
            }
        }
    }
    
    func productForIndex(_ indexPath: Int) -> ProductModel {
        PRODUCTS[indexPath]
    }
    
    var numberOfProducts: Int {
        PRODUCTS.count
    }
    
    func viewDidLoad() {
        view?.prepareNavBar()
        view?.prepareButtons()
        view?.prepareCollectionView()
        fetchRequest()
    }
}

extension ProductPresenter: ProductInteractorOutput {
    func handleFetchResult(products: ProductModels) {
        self.PRODUCTS = products
        DispatchQueue.main.async {
            self.view?.reloadProducts()
        }
    }
}
