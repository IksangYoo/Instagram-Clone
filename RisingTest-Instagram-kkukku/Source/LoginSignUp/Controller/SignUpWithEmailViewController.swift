//
//  SignUpWithEmailViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/05.
//

import UIKit

class SignUpWithEmailViewController: UIViewController {
    let tryingSignUpUser = TryingSignUpUser.shared
    
    @IBOutlet weak var signUpWithNumberButton: UIButton!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var emailTF: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(topConstraint.constant)
        signUpWithNumberButton.borderColor = UIColor.white.cgColor
        emailTF.loginSignUpTextFieldUI(placeHolder: "이메일 주소")
        emailTF.addUILabelAndButton()
        errorLabel.isHidden = true
        
    }
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goBackToPhone(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        vaildateEmail()
    }
    
    private func vaildateEmail() {
        
        if let email = emailTF.text {
            if let errorMessage = invalidEmail(email) {
                // 잘못된 이메일일 경우
                errorLabel.text = errorMessage
                errorLabel.isHidden = false
                topConstraint.constant = 40
                emailTF.layer.borderColor = #colorLiteral(red: 0.8185104132, green: 0.3387916684, blue: 0.3819541335, alpha: 1)
                emailTF.layer.borderWidth = 2
            } else {
                // 올바른 이메일일 경우
                errorLabel.isHidden = true
                topConstraint.constant = 20
                emailTF.layer.borderWidth = 0.7
                emailTF.layer.borderColor = UIColor.white.cgColor
                tryingSignUpUser.email = emailTF.text
                performSegue(withIdentifier: "goToName", sender: nil)
            }
        }
    }
    
    private func invalidEmail(_ value: String) -> String? {
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        if value == "" {
            return "이메일은 필수 항목입니다."
        } else if !predicate.evaluate(with: value) {
            return "유효한 이메일 주소를 입력하세요."
        }
        
        return nil
    }
}

