//
//  MainViewController.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 05.04.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    // MARK: - Private properties
    
    private let menuViewHeader = MenuViewHeader()
    private let banner = BannerCollectionView()
    private let collectionView = CategoryCollectionView()
    private let bottomElements = BottomView()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Что будете заказывать"
        label.textColor = #colorLiteral(red: 0.5058823529, green: 0.2823529412, blue: 0.5921568627, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        initialize()
    }

    //MARK: - Private constants

    private enum UIConstants{
        static let cellwidth = (UIScreen.main.bounds.width / 2) - 25
        static let heightOfCell = cellwidth + 36
        static let cellsHeight = (UIScreen.main.bounds.width / 2) - 25

    }

}
// MARK: - Private extensions

private extension MainViewController {
    
    func fetchData() {
        guard let url = URL(string: "https://run.mocky.io/v3/01fb73f0-63d0-4891-aa43-dde19bed2ccb") else {          // 6 элементов
//        guard let url = URL(string: "https://run.mocky.io/v3/575483fc-34bc-48ec-92cd-43512b5ecda1") else {          // 9 элементов

            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let categories = try decoder.decode(Category.self, from: data)
                DispatchQueue.main.async {
                    self?.collectionView.categories = categories
                    self?.collectionView.reloadData()
                    self?.getHeight()
                }
            } catch {
                print(error)
            }
        }.resume()
        
    }
    
    func getHeight(){
        if collectionView.categories.count%2 == 0 {
            let count = (collectionView.categories.count) / 2
            
            collectionView.snp.updateConstraints { make in
                make.height.equalTo((Int(UIConstants.heightOfCell)) * count + count * 8)
            }
        }else{
            let count = (collectionView.categories.count + 1) / 2
            collectionView.snp.updateConstraints { make in
                make.height.equalTo((Int(UIConstants.heightOfCell)) * count + count * 8 )
            }
        }
    }
    func initialize(){
        view.backgroundColor = #colorLiteral(red: 0.5058823529, green: 0.2823529412, blue: 0.5921568627, alpha: 1)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.addSubview(menuViewHeader)
        menuViewHeader.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(84)
        }
        menuViewHeader.prifileButton.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)

        view.addSubview(scrollView)
        scrollView.backgroundColor = .white
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
                
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(view).offset(15)
            make.right.equalTo(view).inset(15)
            make.bottom.equalToSuperview()
        }
        
        stackView.addArrangedSubview(banner)
        banner.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.height.equalTo(240)
            make.top.equalToSuperview().offset(16)
        }
        
        stackView.addArrangedSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(banner.snp.bottom).offset(24)
            make.height.equalTo(22)
            make.left.equalToSuperview().offset(15)
        }

        stackView.addArrangedSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.right.equalTo(view).inset(15)
            make.left.equalTo(view).offset(15)
            make.height.equalTo(190)
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
        }
        
//        stackView.addArrangedSubview(collectionView)
//        collectionView.snp.makeConstraints { make in
//            make.right.equalTo(view).inset(15)
//            make.left.equalTo(view).offset(15)
//            make.height.equalTo(190)
//            make.top.equalTo(banner.snp.bottom).offset(32)
//        }
        
        stackView.addArrangedSubview(bottomElements)
        bottomElements.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(24)
            make.left.right.equalTo(view)
//            make.bottom.equalTo(view)
        }
    }
    // MARK: - Move to another controller
    @objc private func profileButtonTapped() {
        let profileVC = PagePersonViewController()
        let navVC = UINavigationController(rootViewController: profileVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
        
    }
}
