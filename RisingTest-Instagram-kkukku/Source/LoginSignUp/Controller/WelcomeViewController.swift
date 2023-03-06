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
        
    }
    
    @IBAction func start(_ sender: UIButton) {
        print(tryingSignUpUser)
        // TODO - 회원가입 API 연결
        // TODO - 메인탭바뷰로 넘어가기
        
    }
    
    func setupView() {
        startButton.borderColor = UIColor.white.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        welcomeLabel.text = "\(tryingSignUpUser.userName!)님, Instagram에 오신 것을 환영합니다"
        profileImageView.image = tryingSignUpUser.profileImage
        UIView.animate(withDuration: 2) {
            self.startButton.alpha = 1
        }
    }
}
