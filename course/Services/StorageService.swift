//
//  StorageService.swift
//  course
//
//  Created by Ricardo Martins on 27/03/21.
//

import Foundation
class StorageService{
    let conf = UserDefaults.standard
    
    func isAuthenticatedUser() -> Bool {
        return false
    }
    
    func authenticateUser(_ user:UserResponse){
        setAuthenticateUserIdentification(user.id!)
        setAuthenticateUserEmail(user.email!)
    }
    
    func setAuthenticateUserIdentification(_ identification:String) {
        conf.set(identification, forKey: UserDefaultKeys.identification.rawValue)
    }
    
    func setAuthenticateUserEmail(_ email:String){
        conf.set(email, forKey: UserDefaultKeys.email.rawValue)
    }
    
    func getAuthenticateUserEmail() -> String? {
        return conf.string(forKey: UserDefaultKeys.email.rawValue)
    }
    
    func getAuthenticateUserId() -> String? {
        return conf.string(forKey: UserDefaultKeys.identification.rawValue)
    }
    
    func logoutUser() {
        conf.removeObject(forKey: UserDefaultKeys.identification.rawValue)
    }
}
