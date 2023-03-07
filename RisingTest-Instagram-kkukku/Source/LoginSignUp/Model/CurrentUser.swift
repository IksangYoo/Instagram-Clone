//
//  CurrentUser.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/07.
//

import Foundation
import UIKit

class CurrentUser {
    
    static let shared = CurrentUser()
    
    private init() { }

    var userInfo: Result?
}
