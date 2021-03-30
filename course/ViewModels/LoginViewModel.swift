//
//  LoginViewModel.swift
//  course
//
//  Created by Ricardo Martins on 22/03/21.
//

import Foundation
class LoginViewModel{
    
    // MARK: - DELEGATE
    var baseProtocolDelegate:BaseProtocol?
    var loginProtocolDelegate:LoginProtocol?
    
    // MARK: - SERVICE
    var baseService:BaseService?
    var storageService:StorageService?
    
    // MARK: - INIT
    init() {
        baseService = BaseService()
        storageService = StorageService()
    }
    
    // MARK: - FUNCTION
    func requestLogin(_ email:String, _ password:String){
        baseProtocolDelegate?.showLoading();
        
        guard validateEmail(email) else {
            baseProtocolDelegate?.showMessage("Erro", ValidateMessage.invalidUser.rawValue)
            return
        }
        
        guard validatePassword(password) else {
            baseProtocolDelegate?.showMessage("Erro", ValidateMessage.invalidPassword.rawValue)
            return
        }
        
        baseService?.request(route: IosiApi.login(email, password), { ( result:Result<UserResponse, Error>) in
            switch(result){
            case .success(let loginResponse):
                DispatchQueue.global(qos: .background).async {
                    self.baseProtocolDelegate?.hideLoading()
                    
                    if loginResponse.id == nil {
                        self.baseProtocolDelegate?.showMessage("Error", ErrorMessage.idNotFoud.rawValue)
                        return
                    }
                    
                    if loginResponse.email == nil{
                        self.baseProtocolDelegate?.showMessage("Error", ErrorMessage.emailNotFound.rawValue)
                        return
                    }
                    
                    self.storageService?.authenticateUser(loginResponse)
                    
                    self.loginProtocolDelegate?.showLogin()
                }
                
            case .failure(let error):
                self.baseProtocolDelegate?.hideLoading()
                self.baseProtocolDelegate?.showMessage("Erro", error.localizedDescription)
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
