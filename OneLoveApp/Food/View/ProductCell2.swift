//
//  ProductCell2.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 02.05.2023.
//


import UIKit
import SnapKit

class ProductCell2: UICollectionViewCell {
    
    var dataProvider = DataProvider()
    
    static let reuseIdentifier = "productCell"
    
    // MARK: - Private properties

    private var image: UIImage? {
        didSet {
            productImage.image = image
        }
    }
    private let viewBackWhite: UIView = {
        let view = UIView()
//            view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
        view.backgroundColor = .white
        return view
    }()
    
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
        label.numberOfLines = 5
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
        contentView.addSubview(viewBackWhite)
        viewBackWhite.addSubview(productPriceLabel)
        viewBackWhite.addSubview(productDescriptionLabel)
        viewBackWhite.addSubview(productNameLabel)
        
        contentView.snp.makeConstraints { make in
            make.height.equalTo(280)
            make.width.equalTo(355)
        }
        productImage.layer.cornerRadius = 18
        productImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(185)
        }
        
        viewBackWhite.layer.cornerRadius = 18
        viewBackWhite.layer.shadowRadius = 10
        viewBackWhite.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewBackWhite.layer.shadowOpacity = 0.5
        viewBackWhite.snp.makeConstraints { make in
            make.top.equalTo(productImage.snp.bottom).inset(18)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
        productNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(14)
        }
        productPriceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
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
