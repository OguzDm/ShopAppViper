//
//  ProductRouter.swift
//  GeliyoViper
//
//  Created by Oguz Demırhan on 2.08.2021.
//

import Foundation
import UIKit

protocol ProductRouterInterface {
    func navigateToVC(name: String,image: String, price: String, description: String)
}

final class ProductRouter{
    
    weak var navigationController: UINavigationController?
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    static func createModule(navigationController: UINavigationController) -> ProductViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "ProductViewController") as! ProductViewController
        let interactor = ProductInteractor()
        let router = ProductRouter(navigationController: navigationController)
        let presenter = ProductPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.output = presenter
        return view
    }
}

extension ProductRouter: ProductRouterInterface {
    
    func navigateToVC(name: String, image: String, price: String, description: String) {
        let productDetailVC = ProductDetailRouter.createModule(name: name, image: image, price: price, description: description)
        self.navigationController?.pushViewController(productDetailVC, animated: true)
    }
}
