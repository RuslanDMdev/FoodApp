//
//  SectionBackground.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 24.04.2023.
//

import UIKit

final class SectionBackground: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 16
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
