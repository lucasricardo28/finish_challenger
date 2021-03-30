//
//  HomeViewModel.swift
//  course
//
//  Created by Ricardo Martins on 29/03/21.
//

import Foundation
class HomeViewModel {
    
    // MARK: - SERVICE
    var storageService:StorageService?
    
    // MARK: - INIT
    init() {
        storageService = StorageService()
    }
    
    func loadingEmail() -> String? {
        return storageService?.getAuthenticateUserEmail()
    }
    
}
