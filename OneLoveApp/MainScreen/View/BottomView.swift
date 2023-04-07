//
//  BottomView.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 06.04.2023.
//


import UIKit
import SnapKit


class BottomView: UIView {
//MARK: - init
    
    init(){
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Private properties

private let view: UIView = {
    let view = UIView()
    return view
}()

private let imageView: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "logoVanLove")
    return view
}()

private let stackViewAboutCompany: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 16
    return stackView
}()

private let aboutCompanyLabel: UILabel = {
    let label = UILabel()
    label.text = "О компании"
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 16)
    return label
}()

private let dostavkaLabel: UILabel = {
    let label = UILabel()
    label.text = "Доставка"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 14)
    return label
}()

private let akchiiLabel: UILabel = {
    let label = UILabel()
    label.text = "Акции"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 14)
    return label
}()

private let vakansiyLabel: UILabel = {
    let label = UILabel()
    label.text = "Вакансии"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 14)
    return label
}()

private let polzSoglashLabel: UILabel = {
    let label = UILabel()
    label.text = "Пользовательское соглашение"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 14)
    return label
}()

private let contactUsLabel: UILabel = {
    let label = UILabel()
    label.text = "Связаться с нами"
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 16)
    return label
}()

private let stackViewContactUs: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 20
    return stackView
}()

private let whatsAppButton: UIButton = {
    let button = UIButton(type: .system)
    button.tintColor = .black
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    button.setTitle("8 800 222-26-86", for: .normal)
    button.setImage(UIImage(named: "whatsapp"), for: .normal)
    button.setTitleColor(.white, for: .normal)
    return button
}()

private let instagrammButton: UIButton = {
    let button = UIButton(type: .system)
    button.tintColor = .black
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    button.setTitle("@onelove", for: .normal)
    button.setImage(UIImage(named: "instagram"), for: .normal)
    button.setTitleColor(.white, for: .normal)
    return button
}()

private let vkButton: UIButton = {
    let button = UIButton(type: .system)
    button.tintColor = .black
    button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    button.setTitle("oneLove", for: .normal)
    button.setImage(UIImage(named: "vk"), for: .normal)
    button.setTitleColor(.white, for: .normal)
    return button
}()

// MARK: - extension
    private extension BottomView{
        func initialize(){
            addSubview(view)
            view.backgroundColor = #colorLiteral(red: 0.5058823529, green: 0.2823529412, blue: 0.5921568627, alpha: 1)
            view.snp.makeConstraints { make in
                make.edges.equalToSuperview()
                make.height.equalTo(700)
            }
        
            view.addSubview(imageView)
            view.addSubview(stackViewAboutCompany)
            stackViewAboutCompany.addArrangedSubview(aboutCompanyLabel)
            stackViewAboutCompany.addArrangedSubview(dostavkaLabel)
            stackViewAboutCompany.addArrangedSubview(akchiiLabel)
            stackViewAboutCompany.addArrangedSubview(vakansiyLabel)
            stackViewAboutCompany.addArrangedSubview(polzSoglashLabel)
            
            
            imageView.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(32)
                make.centerX.equalToSuperview()
                make.width.equalTo(230)
                make.height.equalTo(200)
            }
            stackViewAboutCompany.snp.makeConstraints { make in
                make.top.equalTo(imageView.snp.bottom).offset(24)
                make.left.equalToSuperview().offset(32)
            }
            
            view.addSubview(contactUsLabel)
            contactUsLabel.snp.makeConstraints { make in
                make.top.equalTo(stackViewAboutCompany.snp.bottom).offset(24)
                make.left.equalToSuperview().offset(32)
            }
            view.addSubview(stackViewContactUs)
            stackViewContactUs.addArrangedSubview(whatsAppButton)
            stackViewContactUs.addArrangedSubview(instagrammButton)
            stackViewContactUs.addArrangedSubview(vkButton)
            stackViewContactUs.snp.makeConstraints { make in
                make.top.equalTo(contactUsLabel.snp.bottom).offset(18)
                make.left.equalToSuperview().offset(32)
            }

        }
    }
