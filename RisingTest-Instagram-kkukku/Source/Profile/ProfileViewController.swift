//
//  ProfileViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/07.
//

import UIKit

class ProfileViewController: UIViewController {
    let currentUser = CurrentUser.shared
    @IBOutlet weak var userId: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userId.text = "\(currentUser.userInfo!.userId)"
        print(UserDefaults.standard.string(forKey: "email"))
        print(UserDefaults.standard.string(forKey: "password"))
        
    }
    @IBAction func logout(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "password")
        
        
        let storyboard : UIStoryboard = UIStoryboard(name: "LoginSignUp", bundle: nil)
        guard let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as? UINavigationController else { return }
        
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = loginVC
            UIView.transition(with: window, duration: 1, options: .transitionCrossDissolve ,animations: nil)
        }
    }
    
}
