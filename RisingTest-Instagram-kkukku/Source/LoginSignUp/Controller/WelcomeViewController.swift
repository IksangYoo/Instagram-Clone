//
//  WelcomeViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/06.
//

import UIKit

class WelcomeViewController: UIViewController {
    let tryingSignUpUser = TryingSignUpUser.shared
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
      
        setupView()
        print(tryingSignUpUser.profileImage)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2, delay: 0.5) {
            self.startButton.alpha = 1
        }
    }
    
    @IBAction func start(_ sender: UIButton) {
        print(tryingSignUpUser)
        LoginAPI().login(email: tryingSignUpUser.email!, password: tryingSignUpUser.password!, loginVc: LoginViewController())
    }
    
    func setupView() {
        startButton.alpha = 0
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        welcomeLabel.text = "\(tryingSignUpUser.userName!)님, Instagram에 오신 것을 환영합니다"
        profileImageView.image = tryingSignUpUser.profileImage
        
        if tryingSignUpUser.profileImage == nil {
            profileImageView.image = UIImage(named: "defaultProfileImage")
        } else {
            profileImageView.image = tryingSignUpUser.profileImage
        }
        
    }
}
