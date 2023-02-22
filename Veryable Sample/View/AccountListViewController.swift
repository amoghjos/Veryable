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
    }
}

extension AccountListViewController: AccountListViewModelDelegate {
    func didReceiveAccounts(_ accounts: [String : [Account]]) {
        print(accounts)
    }
}
