//
//  testView.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 28.04.2023.
//

import UIKit
import SnapKit

class testView: UIView {
    //MARK: - init
    init(){
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Private properties
    
    private var image: UIImage? {
        didSet {
            productImage.image = image
        }
    }
    
    private let viewBackWhite: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.image = UIImage(named: "deserts")
        return imageView
    }()
    
    private let productPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "500  ₽"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 5
        label.text = "Шоколадный бисквит со сгущенным молоком, окутанный в молочный бельгийский шоколад Callebaut."
        label.textColor = #colorLiteral(red: 0.537254902, green: 0.5215686275, blue: 0.5215686275, alpha: 1)
        return label
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Кейк-попс"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    //MARK: - Private constants
    
    private enum UIConstants{
        static let imageSize = (UIScreen.main.bounds.width / 2) - 25
    }
    
    
}
    // MARK: - extension
    private extension testView {
        func initialize(){
            addSubview(productImage)
            addSubview(viewBackWhite)
            viewBackWhite.addSubview(productPriceLabel)
            viewBackWhite.addSubview(productDescriptionLabel)
            viewBackWhite.addSubview(productNameLabel)
            
            productImage.layer.cornerRadius = 18
            productImage.snp.makeConstraints { make in
                make.top.left.right.equalToSuperview()
                make.height.equalTo(185)
            }
            viewBackWhite.snp.makeConstraints { make in
                make.top.equalTo(productImage.snp.bottom).inset(18)
                make.left.right.equalToSuperview()
                make.height.equalTo(40)
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
    }

