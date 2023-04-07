//
//  CategoriesView.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 06.04.2023.
//

import UIKit
import SnapKit


class CategoriesView: UIView {
//MARK: - init
    
    init(){
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Private properties

private let view: UIView = {
    let view = UIView()
    return view
}()

private let desertsButton: UIButton = {
    let button = UIButton(type: .system)
    button.tintColor = .black
    button.setImage(UIImage(named: "deserts"), for: .normal)
    return button
}()

private let desertsLabel: UILabel = {
    let label = UILabel()
    label.text = "Десерты"
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
}()


private let cookiesButton: UIButton = {
    let button = UIButton(type: .system)
    button.tintColor = .black
    button.setImage(UIImage(named: "cookies"), for: .normal)
    return button
}()

private let cookiesLabel: UILabel = {
    let label = UILabel()
    label.text = "Печенье"
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
}()


private let trayflsButton: UIButton = {
    let button = UIButton(type: .system)
    button.tintColor = .black
    button.setImage(UIImage(named: "trayfl"), for: .normal)
    return button
}()
private let trayflLabel: UILabel = {
    let label = UILabel()
    label.text = "Трайфлы"
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
}()


private let tartaletkiButton: UIButton = {
    let button = UIButton(type: .system)
    button.tintColor = .black
    button.setImage(UIImage(named: "tartaletki"), for: .normal)
    return button
}()

private let tartaletkiLabel: UILabel = {
    let label = UILabel()
    label.text = "Тарталетки"
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
}()


private let cakeButton: UIButton = {
    let button = UIButton(type: .system)
    button.tintColor = .black
    button.setImage(UIImage(named: "cakes"), for: .normal)
    return button
}()

private let cakeLabel: UILabel = {
    let label = UILabel()
    label.text = "Торты"
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
}()

private let catalogButton: UIButton = {
    let button = UIButton(type: .system)
    button.tintColor = .black
    button.setImage(UIImage(named: "catalog"), for: .normal)
    return button
}()

private let catalogLabel: UILabel = {
    let label = UILabel()
    label.text = "Весь каталог"
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
}()
    
//MARK: - Private constants

private enum UIConstants{
    static let imageSize = (UIScreen.main.bounds.width / 2) - 25
    static let viewHeight = imageSize * 3 + 80
}

// MARK: - extension
    private extension CategoriesView{
        func initialize(){
            addSubview(view)
            view.backgroundColor = .white
            view.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            print(UIConstants.imageSize)
            view.addSubview(desertsButton)
            view.addSubview(desertsLabel)
            view.addSubview(cookiesButton)
            view.addSubview(cookiesLabel)
            view.addSubview(trayflsButton)
            view.addSubview(trayflLabel)
            view.addSubview(tartaletkiButton)
            view.addSubview(tartaletkiLabel)
            view.addSubview(cakeButton)
            view.addSubview(cakeLabel)
            view.addSubview(catalogButton)
            view.addSubview(catalogLabel)
            
            
            desertsButton.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.width.height.equalTo(UIConstants.imageSize)
                make.left.equalTo(15)
            }
            
            desertsLabel.snp.makeConstraints { make in
                make.top.equalTo(desertsButton.snp.bottom).offset(4)
                make.centerX.equalTo(desertsButton)
            }
            
            cookiesButton.snp.makeConstraints { make in
                make.top.equalToSuperview()
                make.width.height.equalTo(UIConstants.imageSize)
                make.right.equalToSuperview().inset(15)
            }
            
            cookiesLabel.snp.makeConstraints { make in
                make.top.equalTo(cookiesButton.snp.bottom).offset(4)
                make.centerX.equalTo(cookiesButton)
            }
            
            trayflsButton.snp.makeConstraints { make in
                make.top.equalTo(desertsLabel.snp.bottom).offset(16)
                make.width.height.equalTo(UIConstants.imageSize)
                make.left.equalTo(15)
            }
            trayflLabel.snp.makeConstraints { make in
                make.top.equalTo(trayflsButton.snp.bottom).offset(4)
                make.centerX.equalTo(trayflsButton)
            }
            
            tartaletkiButton.snp.makeConstraints { make in
                make.top.equalTo(cookiesLabel.snp.bottom).offset(16)
                make.width.height.equalTo(UIConstants.imageSize)
                make.right.equalToSuperview().inset(15)
            }
            tartaletkiLabel.snp.makeConstraints { make in
                make.top.equalTo(tartaletkiButton.snp.bottom).offset(4)
                make.centerX.equalTo(tartaletkiButton)
            }
            
            cakeButton.snp.makeConstraints { make in
                make.top.equalTo(trayflLabel.snp.bottom).offset(16)
                make.width.height.equalTo(UIConstants.imageSize)
                make.left.equalTo(15)
            }
            cakeLabel.snp.makeConstraints { make in
                make.top.equalTo(cakeButton.snp.bottom).offset(4)
                make.centerX.equalTo(cakeButton)
            }
            
            catalogButton.snp.makeConstraints { make in
                make.top.equalTo(tartaletkiLabel.snp.bottom).offset(16)
                make.width.height.equalTo(UIConstants.imageSize)
                make.right.equalToSuperview().inset(15)
            }
            catalogLabel.snp.makeConstraints { make in
                make.top.equalTo(catalogButton.snp.bottom).offset(4)
                make.centerX.equalTo(catalogButton)
            }
            
        }
    }
