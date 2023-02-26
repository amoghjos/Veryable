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
    private let cellIdentifier = "accountCell"
    
    override func viewDidLoad() {
        viewModel.delegate = self
        setUpUserInterface()
    }
    
    private func setUpUserInterface() {
        title = "ACCOUNTS"
        view.backgroundColor = ViewColor.background.color
        tableView.separatorStyle = .none
        tableView.register(AccountListTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

extension AccountListViewController: AccountListViewModelDelegate {
    func didReceiveAccounts() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: Data Source
extension AccountListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.accounts.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let accountType = AccountType.allCases[section]
        return viewModel.accounts[accountType.rawValue]?.count ?? 0

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? AccountListTableViewCell else {
            preconditionFailure("Unable to create AccountListTableViewCell")
        }
        let account = viewModel.getAccount(section: indexPath.section, row: indexPath.row)
        cell.setUp(with: account)
        return cell
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

//MARK: Delegate
extension AccountListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let account = viewModel.getAccount(section: indexPath.section, row: indexPath.row)
        let accountDetailVC = AccountDetailViewController(with: account)
        navigationController?.pushViewController(accountDetailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
