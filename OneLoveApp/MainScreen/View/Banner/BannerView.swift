//
//  BannerView.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 05.04.2023.
//

import UIKit
import SnapKit

class BannerView: UIView {
    
    //MARK: - init
    private var totalHeight: CGFloat = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init(height: CGFloat) {
        let frame = CGRect(x: .zero, y: .zero, width: .zero, height: height)
        super.init(frame: frame)
        totalHeight = height
        initialize()
    }
    

    // MARK: - Private properties
    
    private let view: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy private var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.addSubview(stackView)
        scroll.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.8196078431, blue: 1, alpha: 1)
        scroll.layer.cornerRadius = 10
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Что будете заказывать"
        label.textColor = #colorLiteral(red: 0.5058823529, green: 0.2823529412, blue: 0.5921568627, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logoVanLove")
        return view
    }()
    
    // MARK: - Private methods
    
    private func initialize() {
        addSubview(view)
        view.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(15)
            make.top.equalToSuperview().offset(16)
        }
        
        view.addSubview(scrollView)
        view.addSubview(mainLabel)
        scrollView.addSubview(stackView)
        scrollView.snp.makeConstraints { make in
            make.left.top.right.equalTo(view)
            make.height.equalTo(totalHeight)

        }
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(scrollView)
            make.height.equalToSuperview()
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(24)
            make.left.right.equalTo(view)
        }
    }
    
    private func setupBanner(with image: UIImage) -> UIImageView {
        let view = UIImageView()
        view.image = image
        view.contentMode = .scaleAspectFill
        view.heightAnchor.constraint(equalToConstant: 176).isActive = true
        view.widthAnchor.constraint(equalToConstant: 385).isActive = true
        view.clipsToBounds = true
        return view
    }
    
    func update(with image: UIImage) {
        stackView.addArrangedSubview(setupBanner(with: image))
    }
}
