//
//  File.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 11.04.2023.
//

import UIKit
import SnapKit

class BannerCollectionView: UICollectionView {
    // MARK: - Private properties

    private let cellReuseIdentifier = "BannerCVCell"
    var banners: BannerModel = []
    
    //MARK: - init
    init() {
        let layout = UICollectionViewFlowLayout()

        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        register(BannerCVCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        dataSource = self
        showsHorizontalScrollIndicator = false
        delegate = self
        fetchData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    func fetchData() {
        guard let url = URL(string: "https://run.mocky.io/v3/1ca0b82c-eb65-4e13-84b9-9c764aa4667f") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let banner = try decoder.decode(BannerModel.self, from: data)
                DispatchQueue.main.async {
                    self?.banners = banner
                    self?.reloadData()
                }
            } catch {
                print(error)
            }
        }.resume()
        
    }
}

// MARK: - Extensions

extension BannerCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! BannerCVCell
        cell.banner = banners[indexPath.item]
        return cell
    }
}

extension BannerCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellwidth = (UIScreen.main.bounds.width) - 30
        let cellheight = cellwidth / 2
        return CGSize(width: cellwidth, height: cellheight)
        
    }

}
