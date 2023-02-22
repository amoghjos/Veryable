//
//  Veryable.swift
//  Veryable Sample
//
//  Created by Amogh Joshi on 2/22/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation

extension EndPoints {
    enum Veryable: EndPoint {
        case creditCards
        
        var scheme: String {
            switch self {
            case .creditCards:
                return "https"
            }
        }
        
        var host: String {
            switch self {
            case .creditCards:
                return "veryable-public-assets.s3.us-east-2.amazonaws.com"
            }
        }
        
        var path: String {
            switch self {
            case .creditCards:
                return "/veryable.json"
            }
        }
        
        var queryItems: [URLQueryItem] {
            switch self {
            default:
                return []
            }
        }
    }
}
