//
//  SearchResponse.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/12.
//

import Foundation

struct SearchResponse: Codable{
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    
    var result: [SearchUserResult?]
}

struct SearchUserResult: Codable {
    var userId: Int?
    var profileImage: String?
    var userName: String?
    var status: String?
}
