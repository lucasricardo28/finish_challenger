//
//  NewAccountViewModel.swift
//  course
//
//  Created by Ricardo Martins on 27/03/21.
//

import Foundation
class NewAccountViewModel {
    
    // MARK: - SERVICES
    var baseService:BaseService?
    
    // MARK: - PROTOCOLS
    var baseProtocolDelegate:BaseProtocol?
    
    init() {
        baseService = BaseService()
    }
    
    func sendNextStep(_ name:String, _ surname:String, _ email:String) {
       
        guard validateName(name) else {
            baseProtocolDelegate?.showMessage("Erro", ValidateMessage.userInvalide.rawValue)
            return
        }
        
        guard validatSurname(surname) else {
            baseProtocolDelegate?.showMessage("Erro", ValidateMessage.userInvalide.rawValue)
            return
        }
        
        guard validateEmail(email) else{
            baseProtocolDelegate?.showMessage("Erro", ValidateMessage.userInvalide.rawValue)
            return
        }
    }
    
    private func validateName(_ name:String) -> Bool
    {
        return true
    }
    
    private func validatSurname(_ surname:String) -> Bool
    {
        return true
    }
    
    private func validateEmail(_ email:String) -> Bool
    {
        return true
    }
}
