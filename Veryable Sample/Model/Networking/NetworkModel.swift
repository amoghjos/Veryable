//
//  NetworkModel.swift
//  Veryable Sample
//
//  Created by Amogh Joshi on 2/22/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation

struct NetworkModel {
    
    static func buildURL(from endPoint: EndPoint) -> URL? {
        var urlComponent = URLComponents()
        urlComponent.host = endPoint.host
        urlComponent.scheme = endPoint.scheme
        urlComponent.path = endPoint.path
        urlComponent.queryItems = endPoint.queryItems
        return urlComponent.url
    }
    
    static func makeRequest<T: Codable>(at url: URL, completionHandler: @escaping (Result<T,Error>) -> Void) {
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            
            guard let _ = response, let data = data else {
                return
            }
            
            do {
                let responseObject = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(responseObject))
            } catch {
                completionHandler(.failure(error))
            }
        }
        dataTask.resume()
    }
}
