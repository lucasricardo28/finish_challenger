//
//  BaseService.swift
//  course
//
//  Created by Ricardo Martins on 14/03/21.
//

import Foundation

enum IosiApi {
    
    case verifyEmail(String)
    case login(String, String)
    
    private var baseUrl: String {
        "https://iosi.herokuapp.com"
    }
    
    private var method: String {
        switch self {
        case .verifyEmail:
            return "GET"
        case .login:
            return "POST"
        }
    }
    
    private var body: [String: String] {
        switch self {
        case .verifyEmail:
            return [:]
        case .login(let email, let password):
            return ["email": email, "password": password]
        }
    }
    
    private var uri: String {
        switch self {
        case .verifyEmail(let email):
            return "/users/hasAccount/\(email)"
        case .login(_, _):
            return "/users/login"
        }
    }
    
    var request: URLRequest? {
        
        guard let url = URL(string: baseUrl + self.uri) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = self.method
        request.httpBody = try? JSONEncoder().encode(self.body)
        return request
    }
}

class BaseService {
    
    let baseURL = "https://iosi.herokuapp.com"

    func mountParameters(_ route: String, _ parameters:[ String : String ]? ) -> URLComponents {
        var urlComponents = URLComponents(string: baseURL + route)

        var items:[URLQueryItem] = []

        if let params = parameters {
            for param in params {
                items.append(URLQueryItem(name: param.key, value: param.value))
            }
        }

        urlComponents?.queryItems = items

        return urlComponents!
    }
    
    func request<T:Decodable>(route: IosiApi, _ completion: @escaping (Result<T, Error>) -> Void) {
        guard let request = route.request else { return }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            let customDecoder = JSONDecoder.init();
            
            if let dataJson = data {
                let result = try? customDecoder.decode(T.self, from: dataJson)
                completion(.success(result!))
                print("Final do mapeamento")
            } else {
                print("Mapeamento erro")
            }
        }.resume()
    }
    
}
