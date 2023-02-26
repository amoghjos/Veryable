//
//  AccountListViewModel.swift
//  Veryable Sample
//
//  Created by Amogh Joshi on 2/22/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation

protocol AccountListViewModelDelegate: AnyObject {
    func didReceiveAccounts()
}

class AccountListViewModel {
    
    weak var delegate: AccountListViewModelDelegate?
    var accounts = [String:[Account]]()
    
    init(){
        getAccounts()
    }
        
    private func getAccounts() {
        guard let url = NetworkModel.buildURL(from: EndPoints.Veryable.creditCards) else {
            preconditionFailure("Unable to make URL from EndPoint")
        }
        
        typealias VeryableNetworkResponse = [Account]
        
        NetworkModel.makeRequest(at: url) { [weak self] (result: Result<VeryableNetworkResponse, Error>) in
            switch result {
            case .success(let accounts):
                guard let self = self else { return }
                self.accounts = self.seperateAccounts(accounts)
                self.delegate?.didReceiveAccounts()
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
                dict[account.accountType, default: []].append(account)
            case AccountType.bank.rawValue:
                dict[account.accountType, default: []].append(account)
            default:
                break
            }
        }
        return dict
    }
}
