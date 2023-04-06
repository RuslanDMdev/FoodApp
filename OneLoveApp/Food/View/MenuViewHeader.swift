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
    
    private let backView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let optionsButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "optionsButton")
        button.setImage(icon, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    
    private let prifileButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "profile")
        button.semanticContentAttribute = .forceRightToLeft
        button.setImage(icon, for: .normal)
        return button
    }()
    

    // MARK: - Private methods

    private func setupView() {
        addSubview(backView)
        backView.addSubview(optionsButton)
        backView.addSubview(imageLogoView)
        backView.addSubview(prifileButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        backView.backgroundColor = .white
        backView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(64)
        }
        imageLogoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(64)
            make.height.equalTo(64)
            make.top.equalToSuperview()
        }
        optionsButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(23)
            make.width.equalTo(18)
            make.height.equalTo(12)
            make.leading.equalToSuperview().offset(15)
        }
        
        prifileButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(23)
            make.width.equalTo(24)
            make.height.equalTo(24)
            make.right.equalToSuperview().inset(15)
        }
        
    }
}
