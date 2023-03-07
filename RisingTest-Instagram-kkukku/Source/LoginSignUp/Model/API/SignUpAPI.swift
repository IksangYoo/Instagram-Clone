//
//  SignUpAPI.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/07.
//

import Foundation
import Alamofire

class SignUpAPI {
    
    let url = "\(Constant.BASE_URL)\(Constant.SIGNUP_URL)"
    
    func signUp(with user:  TryingSignUpUser) {
        
        let headers: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded"]
        
        let params: Parameters = [
            "username" : user.email!,
            "password" : user.password!
            //            "age" : user.age!,
            //            "name": user.name!,
            //            "profileImage": user.profileImage!,
            //            "username": user.userName!
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: URLEncoding.default,
                   headers: headers)
        .response { response in
            switch response.result {
            case .success(let response):
                print(response!)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
            
        }
    }
