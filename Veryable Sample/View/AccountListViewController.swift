//
//  AccountListViewController.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import UIKit

class AccountListViewController: UITableViewController {
 
    private lazy var viewModel = AccountListViewModel()
    
    override func viewDidLoad() {
        viewModel.delegate = self
        setUpUserInterface()
    }
    
    private func setUpUserInterface() {
        title = "ACCOUNTS"
        view.backgroundColor = ViewColor.background.color
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 30
        tableView.separatorStyle = .none
    }
}

extension AccountListViewController: AccountListViewModelDelegate {
    func didReceiveAccounts() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension AccountListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.accounts.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let accountType = AccountType.allCases[section]
        return viewModel.accounts[accountType.rawValue]?.count ?? 0

    }
}

extension AccountListViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return AccountListTableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let accountType = AccountType.allCases[section]
        switch accountType {
        case .bank:
            return "Bank Accounts"
        case .card:
            return "Cards"
        }
    }
}
