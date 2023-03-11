//
//  PostResponse.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/11.
//

import Foundation

struct PostResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    
    var PostResults: [PostResult]?
}

struct PostResult: Codable {
    var itemId: Int
    var userId: Int
    var profileImage: String
    var userName: String
    var createdAt: String
    var updatedAt: String
    var itemContent: String
    var stars: Int
    var totalComment: Int
    var itemImages: [String]
}
