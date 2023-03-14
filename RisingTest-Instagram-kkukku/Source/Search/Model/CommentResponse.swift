//
//  CommentResponse.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/14.
//

import Foundation

struct CommentResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [CommentResult]?
}

struct CommentResult: Codable {
    var userId: Int
    var profileImage: String
    var userName: String
    var createdAt: String
    var updatedAt: String
    var commentContent: String
    var stars: Int
    var status: String
    var isLikeComment: Bool?
}
