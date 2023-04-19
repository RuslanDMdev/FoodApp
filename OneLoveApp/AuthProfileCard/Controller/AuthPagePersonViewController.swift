//
//  AuthPagePersonViewController.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 17.04.2023.
//

import UIKit

class AuthPagePersonViewController: UIViewController {

    private let AuthprofileElement = AuthProfileCard()

    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    //MARK: - Private constants

    private enum UIConstants{
        static let HeightAuthprofileElement = UIScreen.main.bounds.height - 306
    }
}
// MARK: - Private methods

private extension AuthPagePersonViewController {
    func initialize(){
        view.backgroundColor = .white
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleLabel.text = "Авторизация"
        navigationItem.titleView = titleLabel
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "arrow-left"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        let leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = leftBarButtonItem
        backButton.snp.makeConstraints { make in
            make.width.height.equalTo(26)
        }
        
        view.addSubview(AuthprofileElement)
        
        AuthprofileElement.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(306)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().inset(24)
            make.height.equalTo(UIConstants.HeightAuthprofileElement)

        }
        AuthprofileElement.LogInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)

    }
    
    // MARK: - Move to another controller
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
        let mainVC = MainViewController()
        let navVC = UINavigationController(rootViewController: mainVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    @objc private func logInButtonTapped() {
        navigationController?.popViewController(animated: true)
        let mainVC = PagePersonViewController()
        let navVC = UINavigationController(rootViewController: mainVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}
