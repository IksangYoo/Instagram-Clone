//
//  UserResponse.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/07.
//

import Foundation
// 옵셔널로
struct UserResponse: Decodable {
    var code: Int
    var isSuccess: Bool
    var message: String
    
    var result: UserResult?
}

struct UserResult: Decodable {
    var userId : Int?
    var jwt: String?
//    var name: String
//    var age: Int
//    var userName: String
//    var profileImageUrlString: String?
}
