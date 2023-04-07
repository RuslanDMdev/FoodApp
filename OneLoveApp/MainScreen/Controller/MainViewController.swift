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
    private let categories = CategoriesView()
    private let bottomElements = BottomView()
    
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
                
        stackView.addArrangedSubview(categories)
        categories.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.height.equalTo(620)
            make.top.equalTo(banner.snp.bottom).offset(32)
        }
        stackView.addArrangedSubview(bottomElements)
        bottomElements.snp.makeConstraints { make in
            make.top.equalTo(categories.snp.bottom).offset(24)
            make.left.right.equalTo(view)
        }
    }
}