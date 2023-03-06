//
//  UserNameViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/06.
//

import UIKit

class UserNameViewController: UIViewController {
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var userNameTF: CustomTextField!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    let tryingSignUpUser = TryingSignUpUser.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.loginSignUpTextFieldUI(placeHolder: "사용자 이름")
        userNameTF.addUILabelAndButton()
        errorLabel.isHidden = true
    }
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goNext(_ sender: UIButton) {
        if userNameTF.text == "" {
            errorLabel.text = "계속하려면 사용자 이름을 선택하세요."
            errorLabel.isHidden = false
            topConstraint.constant = 40
            userNameTF.layer.borderColor = #colorLiteral(red: 0.8185104132, green: 0.3387916684, blue: 0.3819541335, alpha: 1)
            userNameTF.layer.borderWidth = 2
            
        } else if userNameTF.text!.count <= 3 {
            //6자리 이하면
            errorLabel.text = "사용자 이름이 너무 짧습니다. 3자 이상의 문자나 숫자의 조합으로 더 긴 사용자 이름을 만드세요."
            errorLabel.isHidden = false
            topConstraint.constant = 50
            userNameTF.layer.borderColor = #colorLiteral(red: 0.8185104132, green: 0.3387916684, blue: 0.3819541335, alpha: 1)
            userNameTF.layer.borderWidth = 2
            
        } else {
            // 성공시
            errorLabel.isHidden = true
            topConstraint.constant = 20
            userNameTF.layer.borderWidth = 0.7
            userNameTF.layer.borderColor = UIColor.white.cgColor
            tryingSignUpUser.userName = userNameTF.text
            performSegue(withIdentifier: "goToAgree", sender: nil)
            
        }
    }
}
