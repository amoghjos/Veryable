//
//  AccountListViewController.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit

class AccountListViewController: UIViewController {

    //MARK: Inits
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Accounts".uppercased()
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        view.backgroundColor = ViewColor.background.color
    }
}
