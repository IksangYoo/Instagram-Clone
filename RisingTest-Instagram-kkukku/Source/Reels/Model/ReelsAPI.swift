//
//  ReelsAPI.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/15.
//

import Foundation

class ReelsAPI {
    func getReels(reelsVC: ReelsViewController) {
        
        let result = [ReelsModel(like: 10, commentCount: 10, content: "꾸꾸입니다", fileName: "dummyVideo"),ReelsModel(like: 13, commentCount: 3, content: "두번째 릴스입니다", fileName: "dummyVideo02"),ReelsModel(like: 23, commentCount: 20, content: "세번째 릴스입니다", fileName: "dummyVideo03"),ReelsModel(like: 30, commentCount: 20, content: "꾸꾸입니다", fileName: "dummyVideo"),ReelsModel(like: 10, commentCount: 20, content: "안녕하세요 꾸꾸입니다", fileName: "dummyVideo"),ReelsModel(like: 3, commentCount: 2, content: "릴스입니다", fileName: "dummyVideo02"),ReelsModel(like: 13, commentCount: 10, content: "릴스 테스트입니다", fileName: "dummyVideo03"),ReelsModel(like: 10, commentCount: 20, content: "반갑습니다 슈나우저 꾸꾸입니다", fileName: "dummyVideo")]
        
        reelsVC.didSuccess(result: result)
    }
}
