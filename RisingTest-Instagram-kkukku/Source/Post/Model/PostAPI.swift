//
//  PostAPI.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/11.
//

import Foundation
import Alamofire
import FirebaseStorage

class PostAPI {
    let currentUser = CurrentUser.shared
    
    let url = "https://dev.nara2023.shop/postItems"
    
    func getPost() {
        
    }
    
    func uploadPost(urlArray: [String], content: String?, postVC: SetPostViewController) {
        
        guard let jwt = currentUser.userInfo?.jwt else { return }
        print(jwt)
        let headers: HTTPHeaders = ["Content-Type": "application/json",
                                    "x-access-token": jwt]
        let params : Parameters = [
            "itemContent": content,
            "itemImage": "\(urlArray)"
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: JSONEncoding.default,
                   headers: headers)
        .responseJSON { response in
            switch response.result {
            case .success(let result):
                print("서버에 게시물 올리기 성공")
                print(result)
                postVC.didUploadPostSuccess()
            case .failure(let error):
                print(error.localizedDescription)
                print(urlArray)
                postVC.didUploadPostFailure()
            }
        }
    }
}
