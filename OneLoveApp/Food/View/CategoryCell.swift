//
//  CategoryCell.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 24.04.2023.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CategoryCell"
        
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    var isSelectedCell: Bool = false {
        didSet {
            if isSelectedCell {
                textLabel.font = .systemFont(ofSize: 12, weight: .medium)
                backgroundColor = #colorLiteral(red: 0.5058823529, green: 0.2823529412, blue: 0.5921568627, alpha: 1)
                textLabel.textColor = .white
                layer.borderWidth = 0
            } else {
                textLabel.font = .systemFont(ofSize: 12, weight: .medium)
                backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
                textLabel.textColor = .black

            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        textLabelConstraints()
        isSelectedCell = false
        layer.cornerRadius = 16
    }
    
    private func textLabelConstraints() {
        addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
    }
}
