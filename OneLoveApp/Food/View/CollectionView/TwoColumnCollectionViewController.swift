//
//  TwoColumnCollectionViewController.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 06.04.2023.
//

import UIKit

class TwoColumnCollectionViewController: UICollectionViewController {

    let reuseIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the collection view
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        // Set the layout to display two cells per row
        let layout = UICollectionViewFlowLayout()
        let cellWidth = (collectionView.frame.size.width - 30) / 2 // subtract 30 for the section insets
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        collectionView.setCollectionViewLayout(layout, animated: false)
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return the number of cells you want to display
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .gray
        return cell
    }
}
