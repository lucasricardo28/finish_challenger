//
//  LoginViewModel.swift
//  course
//
//  Created by Ricardo Martins on 22/03/21.
//

import Foundation
class LoginViewModel{
    
    var baseProtocolDelegate:BaseProtocol?
    var loginProtocolDelegate:LoginProtocol?
    
    var baseService:BaseService?
    var storageService:StorageService?
    
    init() {
        baseService = BaseService()
        storageService = StorageService()
    }
    
    func requestLogin(_ email:String, _ password:String){
        baseProtocolDelegate?.showLoading();
        
        guard validateEmail(email) else {
            baseProtocolDelegate?.showMessage("Erro", ValidateMessage.userInvalide.rawValue)
            return
        }
        
        guard validatePassword(password) else {
            baseProtocolDelegate?.showMessage("Erro", ValidateMessage.passwordInvalide.rawValue)
            return
        }
        
        baseService?.request(route: IosiApi.login(email, password), { ( result:Result<LoginResponse, Error>) in
            switch(result){
            case .success(let loginResponse):
                
                self.baseProtocolDelegate?.hideLoading()
                
                DispatchQueue.global(qos: .background).async {
                    
//                    guard let userId = loginResponse.id else {
//                        self.baseProtocolDelegate?.showMessage("Erro", ErrorMessage.IdNotFoud.rawValue)
//                        return
//                    }
//                    //self.storageService?.authenticateUser(userId)
                    print(loginResponse.email ?? "nenhum dado encontrado!")
                    self.loginProtocolDelegate?.showLogin()
                }
                
            case .failure(_):
                self.baseProtocolDelegate?.hideLoading()
                self.baseProtocolDelegate?.showMessage("Erro", "Um erro genérico")
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
