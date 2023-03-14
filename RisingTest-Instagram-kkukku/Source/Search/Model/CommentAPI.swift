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
}
