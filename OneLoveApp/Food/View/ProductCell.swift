//
//  ProductCell.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 24.04.2023.
//

import UIKit
import SnapKit

class ProductCell: UICollectionViewCell {
    
    var dataProvider = DataProvider()
    
    static let reuseIdentifier = "productCell"
    
    // MARK: - Private properties

    private var image: UIImage? {
        didSet {
            productImage.image = image
        }
    }
    
    private let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private let productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.537254902, green: 0.5215686275, blue: 0.5215686275, alpha: 1)
        return label
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    //MARK: - Private constants

    private enum UIConstants{
        static let imageSize = (UIScreen.main.bounds.width / 2) - 25
    }
    
    //MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(productImage)
        contentView.addSubview(productPriceLabel)
        contentView.addSubview(productDescriptionLabel)
        contentView.addSubview(productNameLabel)
        
        productImage.layer.cornerRadius = 18
        productImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(185)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(productImage.snp.bottom).inset(18)
            make.left.equalToSuperview().offset(14)
        }
        productPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(productImage.snp.bottom).inset(18)
            make.right.equalToSuperview().inset(14)
        }
        productDescriptionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(14)
            make.right.equalToSuperview().inset(14)
            make.top.equalTo(productPriceLabel.snp.bottom).offset(6)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(model: ProductContentModel) {
        productPriceLabel.layer.borderColor = #colorLiteral(red: 0.9701812863, green: 0.6653127074, blue: 0.7502200007, alpha: 1)
        productPriceLabel.layer.borderWidth = 1
        productPriceLabel.layer.cornerRadius = 6
        
        let urlString = model.imageString!
        let url = URL(string: urlString)!
        dataProvider.downloadImage(url: url) { image in
            self.image = image
        }
        productNameLabel.text = model.productName
        productDescriptionLabel.text = model.productDescription
        if model.productPrice != nil {
            productPriceLabel.text = "от \(model.productPrice!) p"
        }
    }
}
