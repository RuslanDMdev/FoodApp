//
//  CategoryCell.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 07.04.2023.
//

import UIKit
import SnapKit

class CategoryCell: UIView {

    //MARK: - init
        
        init(){
            super.init(frame: .zero)
            initialize()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    // MARK: - Private properties

    private let view: UIView = {
        let view = UIView()
        return view
    }()
    
    private let imageCategoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        return button
    }()

    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Десерты"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    //MARK: - Private constants

    private enum UIConstants{
        static let imageSize = (UIScreen.main.bounds.width / 2) - 25
    }

    // MARK: - Public methods
    func configure(image: UIImage?, text: String?) {
        imageCategoryButton.setImage(image, for: .normal)
        categoryLabel.text = text
    }
}


// MARK: - extension
private extension CategoryCell{
    func initialize(){
        addSubview(view)
        view.snp.makeConstraints { make in
            make.height.equalTo(200)
        }
        view.addSubview(imageCategoryButton)
        view.addSubview(categoryLabel)
        imageCategoryButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.height.equalTo(UIConstants.imageSize)
            make.left.equalTo(15)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(imageCategoryButton.snp.bottom).offset(4)
            make.centerX.equalTo(imageCategoryButton)
        }
    }
}
