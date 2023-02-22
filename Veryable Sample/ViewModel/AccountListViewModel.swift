//
//  AccountListViewModel.swift
//  Veryable Sample
//
//  Created by Amogh Joshi on 2/22/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation

protocol AccountListViewModelDelegate: AnyObject {
    func didReceiveAccounts(_ accounts: [String:[Account]])
}

class AccountListViewModel {
    
    weak var delegate: AccountListViewModelDelegate?
    
    init(){
        guard let url = NetworkModel.buildURL(from: EndPoints.Veryable.creditCards) else {
            preconditionFailure("Unable to make URL from EndPoint")
        }
        
        typealias VeryableNetworkResponse = [Account]
        
        #warning("fix memory leak")
        NetworkModel.makeRequest(at: url) { (result: Result<VeryableNetworkResponse, Error>) in
            switch result {
            case .success(let accounts):
                let seperateAccounts = self.seperateAccounts(accounts)
                self.delegate?.didReceiveAccounts(seperateAccounts)
            case .failure(let error):
                preconditionFailure("Unable to get account information. Something went wrong with networking. Please check the error: \(error)")
            }
        }
    }
    
    private func seperateAccounts(_ accounts: [Account]) -> [String: [Account]] {
        var dict = [String:[Account]]()
        for account in accounts {
            switch account.accountType {
            case AccountType.card.rawValue:
                dict["Cards", default: []].append(account)
            case AccountType.bank.rawValue:
                dict["Bank Accounts", default: []].append(account)
            default:
                break
            }
        }
        return dict
    }
}
