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
    private let bannersView = BannerView(height: 192)
    private let tableView = MenuTableView()

    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    

}
// MARK: - Private extensions

private extension MainViewController {
    func initialize(){
        view.backgroundColor = .white

        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.addSubview(menuViewHeader)
        menuViewHeader.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(84)
        }
        
        view.addSubview(tableView)
        tableView.tableHeaderView = bannersView
        tableView.tableHeaderView?.snp.makeConstraints({ make in
            make.height.equalTo(10)
            make.width.equalToSuperview()
            make.top.equalToSuperview().offset(16)
        })
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(view)
            
        }
        
        let label = UILabel()
        tableView.addSubview(label)
        label.text = "Что будете заказывать ?"
        label.font = UIFont.systemFont(ofSize: 28)
        label.textColor = .purple
        label.snp.makeConstraints { make in
            make.top.equalTo(self.tableView.tableHeaderView!.snp.bottom).offset(267.5)
            make.left.equalToSuperview().offset(15)
        }
        

    }
}
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    

        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return section == 0 ? nil : "Section \(section)"
        }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
}
