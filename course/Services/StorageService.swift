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
    
    func authenticateUser(_ identification:String) {
        conf.set(identification, forKey: UserDefaultKeys.identification.rawValue)
    }
    
    func logoutUser() {
        conf.removeObject(forKey: UserDefaultKeys.identification.rawValue)
    }
}
