//
//  ProfileCellOfStack.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 13.04.2023.
//

import UIKit
import SnapKit

class ProfileCellOfStack: UIView {
    //MARK: - init
    init(){
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - properties
    
    let imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Текст Ячейки"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let forwardArrow: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "arrow-down")
        return view
    }()
    
    let lineView: UIView = {
        let view = UIView()
        return view
    }()
}


// MARK: - extension
private extension ProfileCellOfStack{
    func initialize(){
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(forwardArrow)
        addSubview(lineView)
        imageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.width.equalTo(19)
            make.height.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(10)
            make.top.equalToSuperview()
        }
        
        forwardArrow.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview().inset(5)
            make.width.equalTo(19)
            make.height.equalTo(20)
        }
        
        lineView.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.937254902, blue: 0.937254902, alpha: 1)
        lineView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(19)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
