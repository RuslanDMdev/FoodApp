//
//  CustomCollectionView.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 10.04.2023.
//

import UIKit
import SnapKit

class CustomCollectionView: UICollectionView {
    // MARK: - Private properties

    private let cellReuseIdentifier = "CategoryCell"
    private var categories: Category = []
    
    
    //MARK: - init

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .white
        register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        dataSource = self
        delegate = self
        
        fetchData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func fetchData() {
        guard let url = URL(string: "https://run.mocky.io/v3/4cc3458f-d205-493a-a9b8-0242619d073a") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let categories = try decoder.decode(Category.self, from: data)
                DispatchQueue.main.async {
                    self?.categories = categories
                    self?.reloadData()
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}

// MARK: - Extensions

extension CustomCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CategoryCollectionViewCell
        cell.category = categories[indexPath.item]
        return cell
    }
}

extension CustomCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellwidth = (UIScreen.main.bounds.width / 2) - 25
        let cellheight = cellwidth + 25
        return CGSize(width: cellwidth, height: cellheight)
    }
}
