//
//  ProductCollectionViewCell.swift
//  Geliyo
//
//  Created by Oguz Demırhan on 31.07.2021.
//

import UIKit
import SDWebImage

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ProductCollectionViewCell"
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productBackgroundview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productBackgroundview.backgroundColor = .clear
        productTitleLabel.textColor = .black
        productBackgroundview.layer.borderWidth = 0.24
        productBackgroundview.layer.borderColor = UIColor.lightGray.cgColor
        productBackgroundview.layer.cornerRadius = 10
        productImageView.layer.cornerRadius = 10
        productImageView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
    
    func configure(image: String, title: String, price: String){
        self.productImageView.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "placeholder"))
        self.productTitleLabel.text = title
        self.productPriceLabel.text = price + " TL"
    }
}
