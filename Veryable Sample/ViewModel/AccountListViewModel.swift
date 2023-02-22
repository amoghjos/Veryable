//
//  AccountListViewModel.swift
//  Veryable Sample
//
//  Created by Amogh Joshi on 2/22/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation

class AccountListViewModel {
    func getCreditCards() {
        guard let url = NetworkModel.buildURL(from: EndPoints.Veryable.creditCards) else {
            preconditionFailure("Unable to make URL")
        }
    }
}
