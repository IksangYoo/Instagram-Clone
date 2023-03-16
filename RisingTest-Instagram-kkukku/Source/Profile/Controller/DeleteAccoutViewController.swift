//
//  DeleteAccoutViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/16.
//

import UIKit
import Kingfisher

class DeleteAccoutViewController: UIViewController {

    let userInfo = CurrentUser.shared.userInfo
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let urlSting = userInfo?.profileImage {
            guard let url = URL(string: (userInfo?.profileImage)!) else { return }
            profileImageView.kf.setImage(with: url)
        } else {
            profileImageView.image = UIImage(named: "defaultProfileImage")
        }
        
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }

    @IBAction func goBack(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteAccout(_ sender: UIButton) {
        DeleteAccountAPI().deleteAccout(userId: (userInfo?.userId)!, deleteAccoutVC: self)
    }
    
    func didSuccess() {
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
