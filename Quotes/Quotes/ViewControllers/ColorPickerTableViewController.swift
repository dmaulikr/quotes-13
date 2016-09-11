//
//  ColorPickerTableViewController.swift
//  Quotes
//
//  Created by Jaime Paulo on 11/09/16.
//  Copyright © 2016 Doist. All rights reserved.
//

import UIKit

class ColorPickerTableViewController: UITableViewController {

    var completionBlock: ((color: UIColor) -> Void)?

    private let colors: [(String, UIColor)] = UIColor.availableColors()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = NSLocalizedString("Color", comment: "")

        tableView.allowsSelection = true
        tableView.tableFooterView = UIView()
        tableView.register(ColorPickerTableViewCell.self, forCellReuseIdentifier: String(ColorPickerTableViewCell.self))
    }

    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let colorInfo = colors[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: String(ColorPickerTableViewCell.self), for: indexPath) as! ColorPickerTableViewCell

        cell.configure(color: colorInfo.1, colorName: colorInfo.0)

        return cell
    }

    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        completionBlock?(color: colors[indexPath.row].1)
    }
}
