//
//  MainTabBarController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/16.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.delegate = self
    }
    
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        if let index = tabBarController.viewControllers?.firstIndex(of: viewController) {
//            if index == 0 {
//                // 첫 번째 탭 선택 시 이미지 변경
//                viewController.tabBarItem.image = UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal)
//            }
//        }
//    }
//
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        if let index = tabBarController.viewControllers?.firstIndex(of: viewController) {
//            if index == 0 {
//                // 첫 번째 탭 선택 시 이미지 변경
//                viewController.tabBarItem.image = UIImage(named: "dmIcon")?.withRenderingMode(.alwaysOriginal)
//            }
//        }
//        return true
//    }
}
