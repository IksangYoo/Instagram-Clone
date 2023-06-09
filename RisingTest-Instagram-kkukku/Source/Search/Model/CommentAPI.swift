//
//  CommentAPI.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/14.
//

import Foundation
import Alamofire

class CommentAPI {
    func getComment(postID: Int, page: Int, postDetailVC: PostDetailViewController) {
        let commentUrl = "/postItems/\(postID)/comments?size=20&page=\(page)"
        let url = Constant.BASE_URL+commentUrl
        AF.request(url,
                   method: .get)
        .responseDecodable(of: CommentResponse.self) { response in
            switch response.result {
            case .success(let response):
                print("댓글 조회 성공")
                postDetailVC.didGetCommentSuccess(result: response.result!)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func postComment(postID: Int, content: String, postDetailVC: PostDetailViewController) {
        let postCommentUrl = "/postItems/\(postID)/comments"
        let url = Constant.BASE_URL+postCommentUrl
        let jwt = UserDefaults.standard.string(forKey: "jwt")
        let headers : HTTPHeaders = ["x-access-token": jwt!]
        let params : Parameters = ["commentContent": content]
        
        AF.request(url,
                   method: .post,
                   parameters: params,
                   headers: headers)
        .responseJSON { response in
            switch response.result {
            case .success(let response):
                print("댓글 올리기 성공")
                postDetailVC.didPostCommentSuccesss()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
