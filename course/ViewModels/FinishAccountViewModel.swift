//
//  FinishAccountViewModel.swift
//  course
//
//  Created by Ricardo Martins on 28/03/21.
//

import Foundation
class FinishAccountViewModel{
    
    // MARK: - SERVICE
    var baseService:BaseService?
    var storageService:StorageService?
    
    // MARK: - PROTOCOL
    var baseProtocolDelegate:BaseProtocol?
    var finishProtocolDelegate:FinishAccountProtocol?
    
    // MARK: - INIT
    init() {
        baseService = BaseService()
        storageService = StorageService()
    }
    
    // MARK: - FUNCTIONS
    func createNewUser(_ user:User, _ confirmPassword:String){
        guard let password = user.password else {
            baseProtocolDelegate?.showMessage("Erro", ValidateMessage.invalidPassword.rawValue)
            return
        }
        
        guard validatePassword(password) else {
            baseProtocolDelegate?.showMessage("Erro", ValidateMessage.invalidFormatPassword.rawValue)
            return
        }
        
        guard validateConfirmPassword(password, confirmPassword) else {
            baseProtocolDelegate?.showMessage("Erro", ValidateMessage.invalidConfirmPassword.rawValue)
            return
        }
        
        baseProtocolDelegate?.showLoading()
        
        baseService?.request(route: IosiApi.createUser(user.name, user.surname, user.email, password, nil, nil), { ( result:Result<UserResponse, Error>) in
            switch(result){
            case .success(let finishAccountResponse):
                
                DispatchQueue.global(qos: .background).async {
                    self.baseProtocolDelegate?.hideLoading()
                    
                    if finishAccountResponse.id == nil {
                        self.baseProtocolDelegate?.showMessage("Error", ErrorMessage.idNotFoud.rawValue)
                        return
                    }
                    
                    if finishAccountResponse.email == nil{
                        self.baseProtocolDelegate?.showMessage("Error", ErrorMessage.emailNotFound.rawValue)
                        return
                    }
                    
                    self.storageService?.authenticateUser(finishAccountResponse)
                    
                    self.finishProtocolDelegate?.sendHomeView()
                }
                
            case .failure(_):
                self.baseProtocolDelegate?.hideLoading()
                self.baseProtocolDelegate?.showMessage("Erro", "Um erro genérico")
            }
        })
        
    }
    
    private func validatePassword(_ password:String) -> Bool{
        return true
    }
    
    private func validateConfirmPassword(_ password:String, _ confirmPassword:String) -> Bool {
        return true
    }
    
}
