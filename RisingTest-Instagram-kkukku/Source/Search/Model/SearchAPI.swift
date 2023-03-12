//
//  SearchAPI.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/12.
//

import Foundation
import Alamofire

class SearchAPI {
    let searchURL = "/app/users/?userName="
    
    func search(searchText: String, searchVC: SearchViewController) {
        let url = "\(Constant.BASE_URL)\(searchURL)\(searchText)"
        let jwt = UserDefaults.standard.string(forKey: "jwt")
        let headers: HTTPHeaders = ["x-access-token": jwt!]
        
        AF.request(url,
                   method: .get,
                   headers: headers)
        .responseDecodable(of: SearchResponse.self) { response in
            switch response.result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
}
