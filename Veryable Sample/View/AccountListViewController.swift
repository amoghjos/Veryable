//
//  AccountListViewController.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import UIKit

class AccountListViewController: UIViewController {
 
    var viewModel = AccountListViewModel()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        self.title = "ACCOUNTS"
        view.backgroundColor = ViewColor.background.color
        viewModel.delegate = self
    }
}

extension AccountListViewController: AccountListViewModelDelegate {
    func didReceiveAccounts(_ accounts: [Account]) {
        print(accounts)
    }
}
