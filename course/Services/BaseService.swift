//
//  BaseService.swift
//  course
//
//  Created by Ricardo Martins on 14/03/21.
//

import Foundation
class BaseService {
    
    private let baseUrl = "https://api.pexels.com/v1"
    
    func mountParameters(_ route:String, _ parameters:[ String : String ]? ) -> URLComponents {
        var urlComponents = URLComponents(string: baseUrl + route)
        
        var items:[URLQueryItem] = []
        
        if let params = parameters {
            for param in params {
                items.append(URLQueryItem(name: param.key, value: param.value))
            }
        }
        
        urlComponents?.queryItems = items
        
        return urlComponents!
    }
    
    func request<T:Decodable>(route:URLRequest, _ completion: @escaping (Result<T, Error>) -> Void)
    {
        URLSession.shared.dataTask(with: route) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            let customDecoder = JSONDecoder.init();
            
            if let data = data {
                let result = try? customDecoder.decode(T.self, from: data)
                completion(.success(result!))
            } else {
                print("Error Loading Data")
            }
        }.resume()
    }
    
}
