//
//  ViewController.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 06.04.2023.
//

import UIKit
import SnapKit


class ViewController: UIViewController {

    // MARK: - Private properties
    
    private var bannersView = BannerView()
    private var tableView = MenuTableView()

    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}


// MARK: - Private extensions

private extension ViewController {
    func initialize(){
        view.backgroundColor = .white
        
        let menuViewHeader = MenuViewHeader()

        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.addSubview(menuViewHeader)
        menuViewHeader.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(65)
        }
        view.backgroundColor = .white
        view.addSubview(bannersView)
        bannersView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
        let customCollectionView = MyCustomCollectionView()
        view.addSubview(customCollectionView)
        customCollectionView.snp.makeConstraints { make in
            make.top.equalTo(bannersView.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
