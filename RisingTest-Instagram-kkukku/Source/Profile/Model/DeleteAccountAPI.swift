//
//  DeleteAccountAPI.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/16.
//

import Foundation
import Alamofire

class DeleteAccountAPI {
    
    func deleteAccout(userId: Int, deleteAccoutVC: DeleteAccoutViewController) {
        let deleteUrl = "/users/status/\(userId)"
        let url = Constant.BASE_URL+deleteUrl
        let jwt = UserDefaults.standard.string(forKey: "jwt")
        let headers : HTTPHeaders = ["x-access-token": jwt!]
        
        
        AF.request(url,
                   method: .patch,
                   headers: headers)
        .responseJSON { response in
            switch response.result {
            case .success(let response):
                print(response)
                deleteAccoutVC.didSuccess()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
