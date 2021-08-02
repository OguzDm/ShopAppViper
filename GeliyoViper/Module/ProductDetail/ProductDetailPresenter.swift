//
//  ProductDetailPresenter.swift
//  GeliyoViper
//
//  Created by Oguz Demırhan on 2.08.2021.
//

import Foundation

protocol ProductDetailPresenterDetail {
    func viewDidLoad()
}

final class ProductDetailPresenter {
    weak var view: ProductDetailViewInterface?
    private let name: String
    private let image: String
    private let price: String
    private let description: String
    
    init(view: ProductDetailViewInterface?,name: String,image: String, price: String, description: String) {
        self.view = view
        self.name = name
        self.image = image
        self.price = price
        self.description = description
    }
}
extension ProductDetailPresenter: ProductDetailPresenterDetail {
    func viewDidLoad() {
        view?.configure()
        view?.fetchProductDetails(name: name, image: image, price: price, description: description)
    }
}
