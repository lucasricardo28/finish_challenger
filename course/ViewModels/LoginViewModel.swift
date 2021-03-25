//
//  LoginViewModel.swift
//  course
//
//  Created by Ricardo Martins on 22/03/21.
//

import Foundation
class LoginViewModel{
    
    var delegate:BaseProtocol?
    var baseService:BaseService?
    
    init() {
        baseService = BaseService()
    }
    
    func requestLogin(_ email:String, _ password:String){
        delegate?.showLoading();
        
        let urlComponents = baseService?.mountUrlWithParams("/ricardo", nil)
        if let url = urlComponents?.url {
            let urlRequest = URLRequest(url: url)
            baseService?.request(route: urlRequest, method:"POST", { ( result:Result<InitialResponse, Error>) in
                switch(result){
                case .success(_):
                    self.delegate?.hideLoading()
                    print("Deu bom")
                case .failure(_):
                    self.delegate?.hideLoading()
                    print("Deu ruim")
                }
            })
        }
    }
    
}
