//
//  AuthProfileCard.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 17.04.2023.
//

import UIKit
import SnapKit

class AuthProfileCard: UIView {
    //MARK: - init
    init(){
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - properties
    
    private let firstLabel: UILabel = {
        let label = UILabel()
        label.text = "Укажите номер"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите номер телефона для авторизации"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let LogInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
        button.layer.cornerRadius = 12
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Войти", for: .normal)
        return button
    }()
    
    private let thirdLabel: UILabel = {
        let label = UILabel()
        label.text = "Продолжая, я подтверждаю, что согласен с правилами, условиями и политикой конфиденциальности."
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 2
        return label
    }()

    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "+7(___)-___-__-__"
        textField.textAlignment = .left
        textField.keyboardType = .phonePad
        return textField
    }()

    private let skipButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.8235294118, green: 0.8156862745, blue: 0.8156862745, alpha: 1)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Пропустить", for: .normal)
        return button
    }()
    
    //MARK: - Private constants

    private enum UIConstants{
        static let buttonWidth = UIScreen.main.bounds.width - 48
    }
}

// MARK: - extension
private extension AuthProfileCard{
    func initialize(){
        addSubview(firstLabel)
        addSubview(secondLabel)
        addSubview(LogInButton)
        addSubview(thirdLabel)
        addSubview(textField)
        addSubview(skipButton)
        
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        firstLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom).offset(16)
            make.right.left.equalToSuperview()
        }
        
        LogInButton.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(UIConstants.buttonWidth)
            make.height.equalTo(48)
        }
        
        thirdLabel.snp.makeConstraints { make in
            make.top.equalTo(LogInButton.snp.bottom).offset(16)
            make.right.left.equalToSuperview()
        }
        
        skipButton.snp.makeConstraints { make in
//            make.top.equalTo(thirdLabel.snp.bottom).offset(100)
            make.bottom.equalToSuperview().inset(37)
            make.centerX.equalToSuperview()
            make.width.equalTo(UIConstants.buttonWidth)
            make.height.equalTo(48)
        }
    }
    
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text, text.count > 11 {
            LogInButton.backgroundColor = #colorLiteral(red: 0.5058823529, green: 0.2823529412, blue: 0.5921568627, alpha: 1)
            LogInButton.setTitleColor(.white, for: .normal)
        } else {
            LogInButton.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
        }
        
    }
}
