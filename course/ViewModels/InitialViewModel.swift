//
//  InitialViewModel.swift
//  course
//
//  Created by Ricardo Martins on 14/03/21.
//

import Foundation
class InitialViewModel{
    
    var delegate:InitialProtocol?
    var baseService:BaseService?
    
    init() {
        baseService = BaseService()
    }
    
    func requestInitial(_ email:String){
        delegate?.load();
        
//        let urlComponents = baseService?.mountParameters("/ricardo", nil)
//        if let url = urlComponents?.url {
//            let urlRequest = URLRequest(url: url)
        baseService?.request(route: IosiApi.login("email@random.com", "senha"), { ( result:Result<InitialResponse, Error>) in
                switch(result){
                case .success(_):
                    self.delegate?.close()
                    print("Deu bom")
                case .failure(_):
                    self.delegate?.close()
                    print("Deu ruim")
                }
            })
//        }
        
    }
}
