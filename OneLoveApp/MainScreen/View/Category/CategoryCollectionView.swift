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
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selectedCell = collectionView.cellForItem(at: indexPath) as! BannerCVCell
//        let typeOfFood = selectedCell.banner?.type
//        switch typeOfFood {
//        case .Deserts:
//            let controller1 = FoodCategoriesController()
//            navigationController?.pushViewController(controller1, animated: true)
//        case .Cookies:
//            let controller2 = FoodCategoriesController()
//            navigationController?.pushViewController(controller2, animated: true)
//        case .Trayfls:
//            let controller3 = FoodCategoriesController()
//            navigationController?.pushViewController(controller3, animated: true)
//        case .Tartaletki:
//            let controller4 = FoodCategoriesController()
//            navigationController?.pushViewController(controller4, animated: true)
//        case .Cakes:
//            let controller5 = FoodCategoriesController()
//            navigationController?.pushViewController(controller5, animated: true)
//        case .Catalog:
//            let controller6 = FoodCategoriesController()
//            navigationController?.pushViewController(controller6, animated: true)
//        }
//    }
}
