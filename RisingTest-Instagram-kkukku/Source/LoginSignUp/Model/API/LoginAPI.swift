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
    
    func login(email: String, password: String, loginVc: LoginViewController?) {
        
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        let params: Parameters = [
            "email" : email,
            "password" : password
        ]
        
        guard let loginVC = loginVc else { return }
        
        if let indicator = loginVC.indicator {
            indicator.startAnimating()
        }
        
        if let loginButton = loginVC.loginButton {
            loginButton.setTitle("", for: .normal)
        }
        
        
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: JSONEncoding.default,
                   headers: headers)
        .responseDecodable(of: UserResponse.self) { response in
            switch response.result {
            case .success(let response):
                loginVC.didSuccess(response: response)
                UserDefaults.standard.set(email, forKey: "email")
                UserDefaults.standard.set(password, forKey: "password")
                UserDefaults.standard.set(response.result?.jwt, forKey: "jwt")
                print(response)
            case .failure(let error):
                print(error.localizedDescription)
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
