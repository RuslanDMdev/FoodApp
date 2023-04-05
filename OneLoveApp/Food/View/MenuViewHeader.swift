//
//  MenuViewHeader.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 05.04.2023.
//

import UIKit
import SnapKit

class MenuViewHeader: UIView {
    
    //MARK: - init
    
    init(){
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private properties

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
    

    // MARK: - Private methods

    private func setupView() {
        addSubview(optionsButton)
        addSubview(imageLogoView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        imageLogoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(93)
            make.height.equalTo(60)
            make.top.equalToSuperview()
        }
        optionsButton.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
            make.top.equalToSuperview().offset(23)
            make.width.equalTo(16.5)
            make.height.equalTo(12.9)
            make.leading.equalToSuperview().offset(15)
        }
    }
}
