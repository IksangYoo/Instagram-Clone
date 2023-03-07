//
//  UserResponse.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/07.
//

import Foundation

struct UserResponse: Decodable {
    var code: Int
    var isSuccess: Bool
    var message: String
    
    var result: Result
}

struct Result: Decodable {
    var userId : Int
    var jwt: String
//    var name: String
//    var age: Int
//    var userName: String
//    var profileImageUrlString: String?
}
