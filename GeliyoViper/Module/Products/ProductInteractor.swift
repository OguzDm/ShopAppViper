//
//  ProductInteractor.swift
//  GeliyoViper
//
//  Created by Oguz Demırhan on 2.08.2021.
//

import Foundation

protocol ProductInteractorInterface {
    func fetchProducts()
}

protocol ProductInteractorOutput: AnyObject {
    func handleFetchResult(products: ProductModels)
}

final class ProductInteractor{
    weak var output: ProductInteractorOutput?
}
extension ProductInteractor: ProductInteractorInterface {
    func fetchProducts() {
        Service.shared.fetchProducts { products in
            self.output?.handleFetchResult(products: products)
        }
    }
}
