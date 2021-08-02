//
//  ProductDetailViewController.swift
//  GeliyoViper
//
//  Created by Oguz Demırhan on 2.08.2021.
//

import UIKit
import SDWebImage

protocol ProductDetailViewInterface: AnyObject{
    func configure()
    func fetchProductDetails(name: String, image: String, price: String, description: String)
}
class ProductDetailViewController: UIViewController {

    var productImageView: UIImageView!
    var productTitleLabel = UILabel()
    var productPriceLabel = UILabel()
    var productDescriptionLabel = UILabel()
    var presenter: ProductDetailPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}
extension ProductDetailViewController: ProductDetailViewInterface {
    
    func fetchProductDetails(name: String,image: String,price: String, description: String) {
        self.productTitleLabel.text = name
        self.productImageView.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "placeholder"))
        self.productPriceLabel.text = price + " TL"
        self.productDescriptionLabel.text = description
    }
    
    func configure() {
        productImageView = UIImageView(frame: .zero)
        self.view.addSubview(productImageView)
        productImageView.contentMode = .scaleAspectFit
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            productImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.50),
            productImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        productTitleLabel.text = ""
        productTitleLabel.font = .systemFont(ofSize: 18, weight: .regular)
        productTitleLabel.textColor = UIColor.black
        productTitleLabel.backgroundColor = UIColor.clear
        productTitleLabel.textAlignment = .left
        productTitleLabel.numberOfLines = 0
        productTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(productTitleLabel)
        NSLayoutConstraint.activate([
            productTitleLabel.heightAnchor.constraint(equalToConstant: 50),
            productTitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            productTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productTitleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor,constant: 32)
        ])
        
        productPriceLabel.text = ""
        productPriceLabel.font = .systemFont(ofSize: 16, weight: .light)
        productPriceLabel.textColor = #colorLiteral(red: 0.1783767343, green: 0.6113487482, blue: 0.8603592515, alpha: 1)
        productPriceLabel.backgroundColor = UIColor.clear
        productPriceLabel.textAlignment = .center
        productPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(productPriceLabel)
        NSLayoutConstraint.activate([
            productPriceLabel.heightAnchor.constraint(equalToConstant: 50),
            productPriceLabel.widthAnchor.constraint(equalToConstant: 100),
            productPriceLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor,constant: 8),
            productPriceLabel.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        productDescriptionLabel.text = ""
        productDescriptionLabel.font = .systemFont(ofSize: 18, weight: .light)
        productDescriptionLabel.textColor = UIColor.gray
        productDescriptionLabel.backgroundColor = UIColor.clear
        productDescriptionLabel.textAlignment = .left
        productDescriptionLabel.numberOfLines = 0
        productDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(productDescriptionLabel)
        NSLayoutConstraint.activate([
            productDescriptionLabel.topAnchor.constraint(equalTo: productPriceLabel.bottomAnchor,constant: 8),
            productDescriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            productDescriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
}
