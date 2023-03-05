//
//  LoginViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/04.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTF: CustomTextField!
    @IBOutlet weak var passwordTF: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
    }

    func setTextField() {
        emailTF.loginSignUpTextFieldUI(placeHolder: "사용자 이름, 이메일 주소 또는 휴대폰 번호")
        passwordTF.loginSignUpTextFieldUI(placeHolder: "비밀번호")
        emailTF.addUILabel()
        passwordTF.addUILabel()
    }
    
    
}

extension LoginViewController: UITextFieldDelegate {

    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("begin")
//
//        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1289084852, green: 0.1131337956, blue: 0.1604926884, alpha: 0)])
//    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
            
        
    }
}
