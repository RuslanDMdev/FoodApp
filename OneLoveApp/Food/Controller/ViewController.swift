//
//  ViewController.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 05.04.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

private extension ViewController {
    func initialize(){
        view.backgroundColor = .white
        
        let menuViewHeader = MenuViewHeader(height: 100)
        
        navigationController?.navigationBar.addSubview(menuViewHeader)
        menuViewHeader.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        navigationController?.navigationBar.isHidden = false
    }
}
