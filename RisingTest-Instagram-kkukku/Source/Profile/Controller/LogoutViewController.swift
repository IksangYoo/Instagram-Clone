//
//  LogoutViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/10.
//

import UIKit

class LogoutViewController: UIViewController {
    
    @IBOutlet weak var optionView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionView.layer.cornerRadius = 5
    }
    
    @IBAction func logout(_ sender: UIButton) {
        UserDefaults.standard.set(nil, forKey: "email")
        UserDefaults.standard.set(nil, forKey: "password")
        UserDefaults.standard.set(nil, forKey: "jwt")
        
        let storyboard : UIStoryboard = UIStoryboard(name: "LoginSignUp", bundle: nil)
        guard let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as? UINavigationController else { return }
        
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = loginVC
            UIView.transition(with: window, duration: 1, options: .transitionCrossDissolve ,animations: nil)
        }
    }
}
