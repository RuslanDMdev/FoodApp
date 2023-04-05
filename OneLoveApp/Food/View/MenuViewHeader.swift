//
//  MenuViewHeader.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 05.04.2023.
//

import UIKit
import SnapKit

class MenuViewHeader: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(height: CGFloat) {
        let frame = CGRect(x: .zero, y: .zero, width: .zero, height: height)
        super.init(frame: frame)
        setupView()
    }
    
    private let imageLogoView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "VanLoveLogo")
        return view
    }()
    
    private let optionsButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "optionsButton")
        button.setImage(icon, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    


    private func setupView() {
        addSubview(optionsButton)
        addSubview(imageLogoView)
        setupConstraints()
        backgroundColor = .secondarySystemBackground
    }
    
    private func setupConstraints() {
        
        imageLogoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(93)
            make.height.equalTo(60)
            make.top.equalToSuperview()
        }
        optionsButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(16.5)
            make.height.equalTo(12.9)
            make.leading.equalToSuperview().offset(15)
        }
    }
}
