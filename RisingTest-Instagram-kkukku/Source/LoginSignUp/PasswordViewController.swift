//
//  PasswordViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/05.
//

import UIKit

class PasswordViewController: UIViewController {
    @IBOutlet weak var passwordTF: CustomTextField!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTF.loginSignUpTextFieldUI(placeHolder: "비밀번호")
        passwordTF.addUILabelAndButton()
        errorLabel.isHidden = true
    }


    @IBAction func goBack(_ sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func next(_ sender: UIButton) {
        if passwordTF.text == "" {
            errorLabel.text = "비밀번호는 필수 항목입니다"
            errorLabel.isHidden = false
            topConstraint.constant = 40
            passwordTF.layer.borderColor = #colorLiteral(red: 0.8185104132, green: 0.3387916684, blue: 0.3819541335, alpha: 1)
            passwordTF.layer.borderWidth = 2
            
        } else if passwordTF.text!.count <= 5 {
            //6자리 이하면
            errorLabel.text = "비밀번호가 너무 짧습니다. 6자 이상의 문자와 숫자 조합으로 더 긴 비밀번호를 만드세요"
            errorLabel.isHidden = false
            topConstraint.constant = 50
            passwordTF.layer.borderColor = #colorLiteral(red: 0.8185104132, green: 0.3387916684, blue: 0.3819541335, alpha: 1)
            passwordTF.layer.borderWidth = 2
            
        } else {
            // 성공시
            errorLabel.isHidden = true
            topConstraint.constant = 20
            passwordTF.layer.borderWidth = 0.7
            passwordTF.layer.borderColor = UIColor.white.cgColor
            performSegue(withIdentifier: "goToBirthday", sender: nil)
        }
    }
}
