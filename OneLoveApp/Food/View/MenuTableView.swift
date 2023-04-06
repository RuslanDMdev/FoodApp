//
//  MenuTableView.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 05.04.2023.
//

import UIKit
import SnapKit

class MenuTableView: UITableView {

    // MARK: - Private properties

    private let customCellIdentifier = "CustomCell"
    private var menuItems: [String] = []

    // MARK: - Initializers

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        initialize()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }

    // MARK: - Private methods

    private func initialize() {
        // Register the custom cell
        register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuTableViewCell")

        // Set the delegate and data source to self
        delegate = self
        dataSource = self

        // Add the banner view to the table header view
        tableHeaderView = bannerView()

        // Add the menu items
        menuItems = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]

        // Set the table view properties
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 100
        separatorStyle = .none
    }

    private func bannerView() -> UIView {
        // Create and return the banner view
        let bannerView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 200))
        return bannerView
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MenuTableView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        cell.configure()
        return cell
    }

}
