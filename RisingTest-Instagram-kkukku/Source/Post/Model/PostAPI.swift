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
    let baseuURL = "\(Constant.BASE_URL)/postItems"
    
    
    func getPost(homeVC: HomeViewController) {
        let params: Parameters = [
            "size" : "5",
            "page" : "1"
        ]
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        AF.request(baseuURL,
                   method: .get,
                   parameters: params,
                   headers: headers)
        .responseDecodable(of: PostResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("게시물 조회 성공")
                homeVC.didSuccessGetDefaultPost(postResult: response.result!)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getMorePost(page: Int, homeVC: HomeViewController) {
        
        let params: Parameters = [
            "size" : "5",
            "page" : String(page)
        ]
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        AF.request(baseuURL,
                   method: .get,
                   parameters: params,
                   headers: headers)
        .responseDecodable(of: PostResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("페이지네이션 성공")
                homeVC.didSuccessGetMorePost(result: response.result!)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
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
        
        AF.request(baseuURL,
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
