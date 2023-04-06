//
//  BannerView.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 05.04.2023.
//

import UIKit

class BannerView: UIView {
    
//    //MARK: - init
//
//    init(){
//        super.init(frame: .zero)
//        setupView()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
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
        setupView()
    }
    

    // MARK: - Private properties
    

    lazy private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
//        stack.layer.cornerRadius = 15
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    lazy private var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.addSubview(stackView)
        scroll.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.8196078431, blue: 1, alpha: 1)
        scroll.layer.cornerRadius = 15
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    // MARK: - Private methods
    
    private func setupView() {
        addSubview(scrollView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.top.equalToSuperview().offset(16)
//            make.height.equalTo(192.3)
            make.height.equalTo(totalHeight)

        }
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(scrollView)
            make.height.equalToSuperview()
        }
    }
    
    private func setupBanner(with image: UIImage) -> UIImageView {
        let view = UIImageView()
        view.image = image
        view.contentMode = .scaleAspectFill
        view.heightAnchor.constraint(equalToConstant: 192).isActive = true
        view.widthAnchor.constraint(equalToConstant: 385).isActive = true
        view.clipsToBounds = true
        return view
    }
    
    func update(with image: UIImage) {
        stackView.addArrangedSubview(setupBanner(with: image))
    }
}
