//
//  Account.swift
//  Veryable Sample
//
//  Created by Amogh Joshi on 2/22/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation

struct Account: Codable {
    let id: Int
    let accountType: String
    let accountName: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case accountType = "account_type"
        case accountName = "account_name"
        case description = "desc"
        case id = "id"
    }
}
