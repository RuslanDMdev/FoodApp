//
//  ProfileCard.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 13.04.2023.
//


import UIKit
import SnapKit

class ProfileCard: UIView {
    //MARK: - init
    init(){
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - properties
    let profileNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Руслан"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let myData = ProfileCellOfStack()
    let orderHistory = ProfileCellOfStack()
    let myAddresses = ProfileCellOfStack()
    
     let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 18
        return stackView
    }()}


// MARK: - extension
private extension ProfileCard{
    func initialize(){
        addSubview(profileNameLabel)
        addSubview(stackView)
        
        profileNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(15)
        }
        stackView.addArrangedSubview(myData)
        stackView.addArrangedSubview(myAddresses)
        stackView.addArrangedSubview(orderHistory)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(profileNameLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(15)
        }
        myData.imageView.image = UIImage(named: "id-card")
        myData.titleLabel.text = "Мои данные"
        myData.snp.makeConstraints { make in
            make.height.equalTo(38)
            make.left.equalTo(stackView)
            make.right.equalTo(stackView)
        }
        
        myAddresses.imageView.image = UIImage(named: "shopping-bag")
        myAddresses.titleLabel.text = "История заказов"
        myAddresses.snp.makeConstraints { make in
            make.height.equalTo(38)
            make.left.equalTo(stackView)
            make.right.equalTo(stackView)
        }
        
        orderHistory.imageView.image = UIImage(named: "Location")
        orderHistory.titleLabel.text = "Мои адреса"
        orderHistory.snp.makeConstraints { make in
            make.height.equalTo(38)
            make.left.equalTo(stackView)
            make.right.equalTo(stackView)
        }
    }
}
