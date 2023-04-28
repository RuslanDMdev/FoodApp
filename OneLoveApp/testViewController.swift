//
//  testViewController.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 28.04.2023.
//

import UIKit

class testViewController: UIViewController {
    
    private let textElement = testView()
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

}
// MARK: - Private methods

private extension testViewController {
    func initialize(){
        view.backgroundColor = .white
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.text = "TestViewController"
        navigationItem.titleView = titleLabel
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "arrow-left"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        let leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = leftBarButtonItem
        backButton.snp.makeConstraints { make in
            make.width.height.equalTo(26)
        }
        
        view.addSubview(textElement)

        textElement.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(225)
            make.top.equalToSuperview().offset(100)
        }
        
    }
    
    // MARK: - Move to another controller
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
        let mainVC = MainViewController()
        let navVC = UINavigationController(rootViewController: mainVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    

}
