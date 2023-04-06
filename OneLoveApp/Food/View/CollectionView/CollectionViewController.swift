//
//  CollectionViewController.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 06.04.2023.
//

import UIKit
import SnapKit

class MyCustomCollectionView: UICollectionView {
    

    let item1 = MyCustomCollectionViewItem(image: UIImage(systemName: "house")!, title: "Home")
    let item2 = MyCustomCollectionViewItem(image: UIImage(systemName: "person.crop.circle")!, title: "Profile")
    let item3 = MyCustomCollectionViewItem(image: UIImage(systemName: "cart")!, title: "Cart")
    let item4 = MyCustomCollectionViewItem(image: UIImage(systemName: "heart")!, title: "Favorites")
    let item5 = MyCustomCollectionViewItem(image: UIImage(systemName: "gear")!, title: "Settings")
    let item6 = MyCustomCollectionViewItem(image: UIImage(systemName: "questionmark.circle")!, title: "Help")
    
    private var items: [MyCustomCollectionViewItem] = [
        .init(image: UIImage(systemName: "house")!, title: "Home"),
        .init(image: UIImage(systemName: "person.crop.circle")!, title: "Profile"),
        .init(image: UIImage(systemName: "cart")!, title: "Cart"),
        .init(image: UIImage(systemName: "heart")!, title: "Favorites"),
        .init(image: UIImage(systemName: "gear")!, title: "Settings"),
        .init(image: UIImage(systemName: "questionmark.circle")!, title: "Help")]

    
    private let cellSpacing: CGFloat = 10
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .black
        delegate = self
        dataSource = self
        register(MyCustomCollectionViewCell.self, forCellWithReuseIdentifier: MyCustomCollectionViewCell.reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setItems(_ items: [MyCustomCollectionViewItem]) {
        self.items = items
        reloadData()
    }
    
}

extension MyCustomCollectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
        print(items.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: MyCustomCollectionViewCell.reuseIdentifier, for: indexPath) as! MyCustomCollectionViewCell
        cell.configure(with: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = frame.width - (cellSpacing * 3)
        let itemWidth = availableWidth / 2
        let itemHeight = itemWidth + 50 
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}

struct MyCustomCollectionViewItem {
    let image: UIImage
    let title: String
}

