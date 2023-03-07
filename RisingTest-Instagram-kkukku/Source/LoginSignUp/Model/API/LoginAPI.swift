//
//  LoginAPI.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/07.
//

import Foundation
import Alamofire
import UIKit

class LoginAPI {
    
    let url = "\(Constant.BASE_URL)\(Constant.LOGIN_URL)"
    
    func login(email: String, password: String, loginVc: LoginViewController) {
        let headers: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded"]
        
        let params: Parameters = [
            "username" : email,
            "password" : password
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: URLEncoding.default,
                   headers: headers)
        .responseDecodable(of: UserResponse.self) { response in
            switch response.result {
            case .success(let response):
                loginVc.didSuccess(response: response)
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
                loginVc.didFailure()
            }
        }
//        .responseJSON { response in
//            switch response.result {
//            case .success(let response):
//                print(response)
//            case .failure(let error):
//                print(error)
//            }
//        }

    }
}
