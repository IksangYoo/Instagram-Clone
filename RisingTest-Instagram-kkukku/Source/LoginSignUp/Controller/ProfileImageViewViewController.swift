//
//  ProfileImageViewViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/06.
//

import UIKit

class ProfileImageViewViewController: UIViewController, optionVCDelegate {
  
    
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var profileImagView: UIImageView!
    @IBOutlet weak var modifyButton: UIImageView!
    @IBOutlet weak var shareView: UIView!
    @IBOutlet weak var shareLabel: UILabel!
    let tryingSignUpUser = TryingSignUpUser.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }

    func setupView() {
        self.navigationItem.setHidesBackButton(true, animated: false)
        skipButton.borderColor = UIColor.white.cgColor
        shareView.layer.cornerRadius = 4
        profileImagView.layer.cornerRadius = profileImagView.frame.size.width / 2
        profileImagView.layer.borderColor = UIColor.white.cgColor
        profileImagView.layer.borderWidth = 6
        profileImagView.clipsToBounds = true
        modifyButton.isHidden = true
        shareView.isHidden = true
        shareLabel.isHidden = true
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        if sender.currentTitle == "사진 추가" {
            guard let optionVC = self.storyboard?.instantiateViewController(identifier: "optionVC") as? OptionViewController else { return }
            optionVC.delegate = self
            present(optionVC, animated: true, completion: nil)
        } else {
            print("완료")
            tryingSignUpUser.profileImage = profileImagView.image?.pngData()?.base64EncodedString()
            //회원가입 api 호출
            SignUpAPI().signUp(with: tryingSignUpUser)
            performSegue(withIdentifier: "goToWelcome", sender: nil)
            
        }
    }
    
    @IBAction func skip(_ sender: UIButton) {
        if sender.currentTitle == "건너뛰기" {
            print("건너뛰기")
            //건너뛰기시 기본이미지
            tryingSignUpUser.profileImage = profileImagView.image?.pngData()?.base64EncodedString()
            //회원가입 api 호출
            SignUpAPI().signUp(with: tryingSignUpUser)
            performSegue(withIdentifier: "goToWelcome", sender: nil)
        } else {
            guard let optionVC = self.storyboard?.instantiateViewController(identifier: "optionVC") as? OptionViewController else { return }
            optionVC.delegate = self
            present(optionVC, animated: true, completion: nil)
            print("사진 변경")
        }
        
    }
    
    func setProfileImageView(image: UIImage) {
        changeViewWhenImageFilled()
        profileImagView.image = image
        
    }
    
    func deleteProfileImageView() {
        profileImagView.image = UIImage(named: "defaultProfileImage")
        addButton.setTitle("사진 추가", for: .normal)
        skipButton.setTitle("건너뛰기", for: .normal)
        modifyButton.isHidden = true
        shareView.isHidden = true
        shareLabel.isHidden = true
    }
    
    
    private func changeViewWhenImageFilled() {
        addButton.setTitle("완료", for: .normal)
        skipButton.setTitle("사진 변경", for: .normal)
        modifyButton.isHidden = false
        shareView.isHidden = false
        shareLabel.isHidden = false
    }
}
