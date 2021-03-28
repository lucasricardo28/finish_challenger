//
//  UserService.swift
//  course
//
//  Created by Ricardo Martins on 28/03/21.
//

import Foundation
class UserResponse: Decodable {
    
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
