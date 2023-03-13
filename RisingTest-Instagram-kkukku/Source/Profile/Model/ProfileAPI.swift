//
//  ProfileAPI.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/13.
//

import Foundation
import Alamofire

class ProfileAPI {
    
    func getMyProfile(profileVC: ProfileViewController) {
        let myprofileURL = "/app/mypage"
        let url = Constant.BASE_URL+myprofileURL
        let jwt = UserDefaults.standard.string(forKey: "jwt")
        let headers : HTTPHeaders = [ "x-access-token" : jwt!]
        
        AF.request(url,
                   method: .get,
                   headers: headers)
        .responseDecodable(of: MyProfileResponse.self) { response in
            switch response.result {
            case .success(let response):
                print(response)
                profileVC.didSuccess(response: response.result!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getUserProfile(userID: Int, userProfileVC: UserProfileViewController) {
        let userProfilrURL = "/app/users/\(userID)"
        let url = Constant.BASE_URL+userProfilrURL
        
        print("Url -------------> \(url)")
        AF.request(url,
                   method: .get)
        .responseDecodable(of: UserProfileResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("게시물 조회 성공")
                userProfileVC.didSuccess(response: response)
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
