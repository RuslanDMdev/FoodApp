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

private let whatsAppImage: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "whatsapp-logo")
    return view
}()
private let whatsAppLabel: UILabel = {
    let label = UILabel()
    label.text = "8 800 222-26-86"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 14)
    return label
}()


private let instagrammImage: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "insta-logo")
    return view
}()
private let instagrammLabel: UILabel = {
    let label = UILabel()
    label.text = "@onelove"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 14)
    return label
}()

private let vkImage: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "vk-logo")
    return view
}()
private let vkLabel: UILabel = {
    let label = UILabel()
    label.text = "oneLove"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 14)
    return label
}()

// MARK: - extension
    private extension BottomView{
        func initialize(){
            addSubview(view)
            view.backgroundColor = #colorLiteral(red: 0.5058823529, green: 0.2823529412, blue: 0.5921568627, alpha: 1)
            view.snp.makeConstraints { make in
                make.edges.equalToSuperview()
                make.height.equalTo(600)
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
            stackViewContactUs.addArrangedSubview(whatsAppImage)
            stackViewContactUs.addArrangedSubview(instagrammImage)
            stackViewContactUs.addArrangedSubview(vkImage)
            view.addSubview(whatsAppLabel)
            view.addSubview(instagrammLabel)
            view.addSubview(vkLabel)
            stackViewContactUs.snp.makeConstraints { make in
                make.top.equalTo(contactUsLabel.snp.bottom).offset(18)
                make.left.equalToSuperview().offset(32)
            }
            
            whatsAppImage.snp.updateConstraints { make in
                make.width.height.equalTo(24)
            }
            whatsAppLabel.snp.makeConstraints { make in
                make.left.equalTo(whatsAppImage.snp.right).offset(11)
                make.centerY.equalTo(whatsAppImage)
            }
            
            instagrammImage.snp.updateConstraints { make in
                make.width.height.equalTo(24)
            }
            instagrammLabel.snp.makeConstraints { make in
                make.left.equalTo(instagrammImage.snp.right).offset(11)
                make.centerY.equalTo(instagrammImage)
            }
            
            vkImage.snp.updateConstraints { make in
                make.width.height.equalTo(24)
            }
            vkLabel.snp.makeConstraints { make in
                make.left.equalTo(vkImage.snp.right).offset(11)
                make.centerY.equalTo(vkImage)
            }
        }
    }
