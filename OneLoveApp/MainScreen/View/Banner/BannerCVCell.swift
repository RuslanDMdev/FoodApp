//
//  BannerCVCell.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 11.04.2023.
//

import UIKit
import SnapKit
import SDWebImage

class BannerCVCell: UICollectionViewCell {
    
    
    var banner: BannerModelElement? {
        didSet {
            guard let banner = banner else {
                return
            }
            imageView.sd_setImage(with: URL(string: banner.image))
        }
    }
    // MARK: - Private properties

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    //MARK: - Private constants

    private enum UIConstants{
        static let imageWidth = UIScreen.main.bounds.width  - 30
        static let imageHeight = imageWidth / 2

    }
    
    //MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(15)
            make.width.equalTo(UIConstants.imageWidth)
            make.height.equalTo(UIConstants.imageHeight)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openBrowser))
              contentView.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func openBrowser() {
        guard let url = URL(string: "https://vanlav.ru") else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
