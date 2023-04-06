//
//  MenuTableViewCell.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 06.04.2023.
//

import UIKit
import SnapKit

class MenuTableViewCell: UITableViewCell {
    
    let squareView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func configure() {
    }
    
    private func setupView() {
        selectionStyle = .none
        backgroundColor = .clear
        
        squareView.backgroundColor = .systemGray3
        contentView.addSubview(squareView)
        squareView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(12)
            make.bottom.trailing.equalToSuperview().offset(-12)
            make.width.height.equalTo(163)
        }
    }
}
