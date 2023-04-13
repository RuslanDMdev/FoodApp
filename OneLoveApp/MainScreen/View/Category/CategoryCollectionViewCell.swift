//
//  CategoryCollectionViewCell.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 10.04.2023.
//

import UIKit
import SnapKit
import SDWebImage

class CategoryCollectionViewCell: UICollectionViewCell {
    
    
    var category: CategoryElement? {
        didSet {
            guard let category = category else {
                return
            }
            nameLabel.text = category.name
            imageView.sd_setImage(with: URL(string: category.image))
        }
    }
    // MARK: - Private properties

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    //MARK: - Private constants

    private enum UIConstants{
        static let imageSize = (UIScreen.main.bounds.width / 2) - 25
    }
    
    //MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.height.equalTo(UIConstants.imageSize)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(4)
            make.centerX.equalTo(imageView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
