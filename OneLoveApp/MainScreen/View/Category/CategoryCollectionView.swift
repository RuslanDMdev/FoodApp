//
//  CategoryCollectionView.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 10.04.2023.
//

import UIKit
import SnapKit

class CategoryCollectionView: UICollectionView {
    // MARK: - Private properties

    private let cellReuseIdentifier = "CategoryCell"
    var categories: Category = []
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Что будете заказывать"
        label.textColor = #colorLiteral(red: 0.5058823529, green: 0.2823529412, blue: 0.5921568627, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    //MARK: - init

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .white
        register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
}

// MARK: - Extensions

extension CategoryCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CategoryCollectionViewCell
        cell.category = categories[indexPath.item]
        return cell
    }
}

extension CategoryCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellwidth = (UIScreen.main.bounds.width / 2) - 25
        let cellheight = cellwidth + 36
        return CGSize(width: cellwidth, height: cellheight)
        
    }
}

extension CategoryCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCategory = categories[indexPath.item]
        print("Selected category: \(selectedCategory)")
    
        let foodType = categories[indexPath.item].foodType
        
    }
}
