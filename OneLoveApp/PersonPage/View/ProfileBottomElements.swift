//
//  ProfileBottomElements.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 13.04.2023.
//

import UIKit
import SnapKit

class ProfileBottomElements: UIView{
    //MARK: - init
    init(){
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - properties
    
    private let LogOutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Выйти", for: .normal)
        return button
    }()

    private let contackUsLabel: UILabel = {
        let label = UILabel()
        label.text = "Связаться с нами"
        label.textColor = #colorLiteral(red: 0.537254902, green: 0.5215686275, blue: 0.5215686275, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    private let deleteAccauntLabel: UILabel = {
        let label = UILabel()
        label.text = "Удалить аккаунт"
        label.textColor = #colorLiteral(red: 0.537254902, green: 0.5215686275, blue: 0.5215686275, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
}

//MARK: - Private constants

private enum UIConstants{
    static let buttonWidth = UIScreen.main.bounds.width - 30
}

// MARK: - extension
private extension ProfileBottomElements{
    func initialize(){
        addSubview(LogOutButton)
        addSubview(contackUsLabel)
        addSubview(deleteAccauntLabel)
        
        LogOutButton.layer.cornerRadius = 12
        LogOutButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(UIConstants.buttonWidth)
            make.centerX.equalToSuperview()
        }
        contackUsLabel.snp.makeConstraints { make in
            make.top.equalTo(LogOutButton.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        deleteAccauntLabel.snp.makeConstraints { make in
            make.top.equalTo(contackUsLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }
}
