//
//  SceneDelegate.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/03.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
//    var isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
//    var isLoggedIn = false
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let Loginstoryboard = UIStoryboard(name: "LoginSignUp", bundle: nil) // storyboard 가져오기
        let MainStoryboard = UIStoryboard(name: "MainTabBar", bundle: nil)

//        if let email = UserDefaults.standard.string(forKey: "email") {
//            if let password = UserDefaults.standard.string(forKey: "password") {
//                LoginAPI().login(email: email, password: password, loginVc: LoginViewController())

                guard let mainVC = MainStoryboard.instantiateViewController(withIdentifier: "MainTabBar") as? UITabBarController else { return }
                window?.rootViewController = mainVC
//            }
//        } else {
//            guard let loginVC = Loginstoryboard.instantiateViewController(withIdentifier: "LoginVC") as? UINavigationController else { return }
//            window?.rootViewController = loginVC
//        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

