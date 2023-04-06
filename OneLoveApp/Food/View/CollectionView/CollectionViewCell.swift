//
//  CollectionViewCell.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 06.04.2023.
//

import UIKit
import SnapKit

class MyCustomCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "MyCustomCollectionViewCell"
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.backgroundColor = .gray
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top).offset(-8)
        }
        
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 2
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(8)
        }
    }
    
    func configure(with item: MyCustomCollectionViewItem) {
        imageView.image = item.image
        titleLabel.text = item.title
    }
    
}
