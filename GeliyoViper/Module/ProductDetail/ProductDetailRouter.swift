//
//  ProductDetailRouter.swift
//  GeliyoViper
//
//  Created by Oguz Demırhan on 2.08.2021.
//

import Foundation
import UIKit

final class ProductDetailRouter {
    
    static func createModule(name: String, image: String, price: String, description: String ) -> ProductDetailViewController {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewController(identifier: "ProductDetailViewController") as! ProductDetailViewController
        let presenter = ProductDetailPresenter(view: view, name: name, image: image, price: price, description: description)
        view.presenter = presenter
        
        return view
    }
}
