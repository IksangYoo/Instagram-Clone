//
//  TryingSignUpUser.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/06.
//

import Foundation
import UIKit

class TryingSignUpUser {
    static let shared = TryingSignUpUser()
    
    var email: String?
    var password: String?
    var name: String?
    var age: Int?
    var userName: String?
    var profileImage: UIImage?
    
    private init() { }
}
