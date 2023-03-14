//
//  PostDetailReponse.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/14.
//

import Foundation

struct PostDetailReponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    
    var result: PostDetailResult
}

struct PostDetailResult: Decodable {
    var userId: Int
    var profileImage: String?
    var userName: String
    var createdAt: String
    var updatedAt: String
    var itemContent: String?
    var stars: Int
    var itemImages: [String]
}
