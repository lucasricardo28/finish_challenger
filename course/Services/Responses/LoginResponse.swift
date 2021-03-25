//
//  LoginResponse.swift
//  course
//
//  Created by Ricardo Martins on 25/03/21.
//

import Foundation
class LoginResponse: Decodable {
    
    var isProfessor:Bool?
    var id:Int?
    var name:String?
    var surname:String?
    var email:String?
    var birthdate:String?
    var picture:String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case picture = "profilePictureURL"
    }
}
