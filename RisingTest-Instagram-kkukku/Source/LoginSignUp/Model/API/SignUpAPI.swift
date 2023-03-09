//
//  SignUpAPI.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/07.
//

import Foundation
import Alamofire
import FirebaseStorage

class SignUpAPI {
    
    
    
    
    let url = "\(Constant.BASE_URL)\(Constant.SIGNUP_URL)"
    
    func signUp(with user:  TryingSignUpUser, vc: ProfileImageViewViewController) {
        let profileVC = vc
        
        if let indicator = profileVC.indicator {
            indicator.startAnimating()
        }
        
        if let loginButton = profileVC.addButton {
            loginButton.setTitle("", for: .normal)
        }
        
        
        let imageData = user.profileImage?.jpegData(compressionQuality: 0.5)
        var base64String = imageData?.base64EncodedString()
        
//        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        if let profileImage = user.profileImage {
            
            let filename = NSUUID().uuidString
            let storageRef = Storage.storage().reference().child(filename)
            guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
            storageRef.putData(imageData) { result, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    print("putData 성공")
                    storageRef.downloadURL { urlString, error in
                        if let e = error {
                            print(e.localizedDescription)
                        } else {
                            print("url download 성공")
                            guard let urlString = urlString?.absoluteString else { return }
                            
                            let params: Parameters = [
                                "email" : user.email!,
                                "password" : user.password!,
                                "userName": user.userName!,
                                "name": user.name!,
                                "age" : user.age!,
                                "profileImage": urlString
                            ]
                            
                            AF.request(self.url,
                                       method: .post,
                                       parameters: params,
                                       encoding: JSONEncoding.default)
                            .responseJSON { response in
                                switch response.result {
                                case .success(let response):
                                    vc.didSuccess()
                                    print("서버 post 성공")
                                case .failure(let error):
                                    vc.didFailure()
                                    print(error.localizedDescription)
                                }
                            }
                        }
                    }
                }
            }
        } else {
            let params: Parameters = [
                "email" : user.email!,
                "password" : user.password!,
                "userName": user.userName!,
                "name": user.name!,
                "age" : user.age!,
                "profileImage": user.profileImage
            ]
            
            AF.request(self.url,
                       method: .post,
                       parameters: params,
                       encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let response):
                    vc.didSuccess()
                    print("서버 post 성공")
                    print(response)
                case .failure(let error):
                    vc.didFailure()
                    print(error.localizedDescription)
                }
            }
        }
    }
}
