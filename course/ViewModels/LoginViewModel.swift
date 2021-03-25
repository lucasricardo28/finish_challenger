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
        
        guard validateEmail(email) else {
            print("Email invalido")
            return
        }
        
        guard validatePassword(password) else {
            print("Senha invalida")
            return
        }
        
        baseService?.request(route: IosiApi.login(email, password), { ( result:Result<LoginResponse, Error>) in
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
    
    private func validateEmail(_ email:String) -> Bool
    {
        return true
    }
    
    private func validatePassword(_ password:String) -> Bool
    {
        return password.count > 5
    }
    
}
