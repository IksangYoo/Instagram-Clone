//
//  RandomUserResponse.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/13.
//

import Foundation
import Kingfisher

struct RandomUserResponse: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [RandomUserResult]?
}

struct RandomUserResult: Codable {
    var userId: Int
    var profileImage: String?
    var userName: String
    var status: String
    var name: String
}
