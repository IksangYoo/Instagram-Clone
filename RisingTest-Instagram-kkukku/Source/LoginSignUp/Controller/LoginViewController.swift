//
//  LoginViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/04.
//

import UIKit
import IQKeyboardManagerSwift

class LoginViewController: UIViewController {
    let currentUser = CurrentUser.shared
    
    @IBOutlet weak var emailTF: CustomTextField!
    @IBOutlet weak var passwordTF: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("login")
        if Device.height < 700 {
            IQKeyboardManager.shared.keyboardDistanceFromTextField = 120
        }
        setTextField()
    }

    func setTextField() {
        emailTF.loginSignUpTextFieldUI(placeHolder: "사용자 이름, 이메일 주소 또는 휴대폰 번호")
        passwordTF.loginSignUpTextFieldUI(placeHolder: "비밀번호")
        
        emailTF.addUILabelAndButton()
        passwordTF.addUILabelAndButton()

    }
    
    @IBAction func login(_ sender: UIButton) {
        LoginAPI().login(email: emailTF.text!, password: passwordTF.text!)
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSignUpWithPhone", sender: nil)
    }
    
    func didSuccess(response: UserResponse) {
        currentUser.userInfo = response.result
    }
    
    func didFailure() {
        
    }
}
    

