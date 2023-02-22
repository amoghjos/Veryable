//
//  AccountListViewModel.swift
//  Veryable Sample
//
//  Created by Amogh Joshi on 2/22/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation

protocol AccountListViewModelDelegate: AnyObject {
    func didReceiveAccounts(_ accounts: [Account])
}

class AccountListViewModel {
    
    weak var delegate: AccountListViewModelDelegate?
    
    init(){
        guard let url = NetworkModel.buildURL(from: EndPoints.Veryable.creditCards) else {
            preconditionFailure("Unable to make URL from EndPoint")
        }
        
        typealias VeryableNetworkResponse = [Account]
        
        NetworkModel.makeRequest(at: url) { (result: Result<VeryableNetworkResponse, Error>) in
            switch result {
            case .success(let accounts):
                self.delegate?.didReceiveAccounts(accounts)
            case .failure(let error):
                preconditionFailure("Unable to get account information. Something went wrong with networking")
            }
        }
    }
    
}
