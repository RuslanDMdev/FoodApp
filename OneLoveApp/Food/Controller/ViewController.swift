//
//  ViewController.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 05.04.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Private properties
    
    private var bannersView = BannerView()
    private var tableView = UITableView()

    
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
            make.height.equalTo(84)
        }
        
        view.addSubview(tableView)
        tableView.tableHeaderView = bannersView
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
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
}
