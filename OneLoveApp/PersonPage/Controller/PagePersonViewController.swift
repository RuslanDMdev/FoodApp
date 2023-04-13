//
//  PagePersonViewController.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 13.04.2023.
//

import UIKit

class PagePersonViewController: UIViewController {
    
    private let profileElement = ProfileCard()
    private let profileBottomElement = ProfileBottomElements()
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

}
// MARK: - Private methods

private extension PagePersonViewController {
    func initialize(){
        view.backgroundColor = .white
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.text = "Профиль"
        navigationItem.titleView = titleLabel
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "arrow-left"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        let leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = leftBarButtonItem
        backButton.snp.makeConstraints { make in
            make.width.height.equalTo(26)
        }
        
        view.addSubview(profileElement)
        view.addSubview(profileBottomElement)

        profileElement.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(225)
            make.top.equalToSuperview().offset(100)
        }
        
        profileBottomElement.snp.makeConstraints { make in
            make.top.equalTo(profileElement.snp.bottom).offset(112)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(300)
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
