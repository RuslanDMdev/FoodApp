//
//  MainViewController.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 05.04.2023.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Private properties
    
    private let menuViewHeader = MenuViewHeader()
    private let banner = BannerView(height: 176)
    private let collectionView = CustomCollectionView()
    private let bottomElements = BottomView()
    var heightColView = 1000
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        return stackView
    }()
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    

}
// MARK: - Private extensions

private extension MainViewController {
    func initialize(){
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.addSubview(menuViewHeader)
        menuViewHeader.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(84)
        }
        
        view.addSubview(scrollView)
        scrollView.backgroundColor = .white
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
                
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(15)
        }
        
        stackView.addArrangedSubview(banner)
        banner.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.height.equalTo(240)
            make.top.equalToSuperview().offset(16)
        }
        
//        let numberOfElementsInArray = collectionView.categories.count
//        if numberOfElementsInArray % 2 == 0 {
//            print("целое чисто \(heightColView)")
//            heightColView = ((Int(UIScreen.main.bounds.width) / 2) - 25) * numberOfElementsInArray + 100
//        } else {
//            let roundedNumberOfElements = (numberOfElementsInArray / 2) + 1
//            heightColView = ((Int(UIScreen.main.bounds.width) / 2) - 25) * roundedNumberOfElements + 100
//            print(heightColView)
//        }
        stackView.addArrangedSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.right.equalTo(view).inset(15)
            make.left.equalTo(view).offset(15)
            make.height.equalTo(((UIScreen.main.bounds.width / 2) - 25) * 3 + 100)
//            make.height.equalTo(heightColView)
            make.top.equalTo(banner.snp.bottom).offset(32)
        }
        
        stackView.addArrangedSubview(bottomElements)
        bottomElements.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(24)
            make.left.right.equalTo(view)
        }
    }
}
