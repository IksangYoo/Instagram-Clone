//
//  MyProfileResponse.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/13.
//

import Foundation

struct MyProfileResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    
    var result: MyProfileResult?
}

struct MyProfileResult: Codable {
    var userId: Int
    var status: String
    var profileImage: String?
    var userName: String
    var name: String
    var following: Int
    var followers: Int
    
    var posts: [MyPost]?
    
    enum CodingKeys: String, CodingKey{
        case userId
        case status
        case profileImage
        case userName
        case name
        case following
        case followers
        case posts = "data"
        }
}

struct MyPost: Codable {
    var hasMoreImages: Bool
    var itemId: Int
    var createdAt: String
    var itemImage: String
}
