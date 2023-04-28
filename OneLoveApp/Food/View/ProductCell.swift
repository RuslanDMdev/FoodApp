//
//  ProductCell.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 24.04.2023.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    var dataProvider = DataProvider()
    
    static let reuseIdentifier = "productCell"
    
    private var image: UIImage? {
        didSet {
            productImage.image = image
            activityIndicatorView.stopAnimating()
            activityIndicatorView.isHidden = true
        }
    }
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    
    func setup(model: ProductContentModel) {

        activityIndicatorView.startAnimating()
        activityIndicatorView.isHidden = false
        
        let urlString = model.imageString!
        let url = URL(string: urlString)!
        dataProvider.downloadImage(url: url) { image in
            self.image = image
        }
        productPriceLabel.font = UIFont.boldSystemFont(ofSize: 18)
        productNameLabel.text = model.productName
        productDescriptionLabel.text = model.productDescription
        if model.productPrice != nil {
            productPriceLabel.text = "\(model.productPrice!)₽"
        }
    }
}
