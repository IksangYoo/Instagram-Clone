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
        print("\(UserDefaults.standard.string(forKey: "email")), \(UserDefaults.standard.string(forKey: "password"))")
    }

    func setTextField() {
        emailTF.loginSignUpTextFieldUI(placeHolder: "사용자 이름, 이메일 주소 또는 휴대폰 번호")
        passwordTF.loginSignUpTextFieldUI(placeHolder: "비밀번호")
        
        emailTF.addUILabelAndButton()
        passwordTF.addUILabelAndButton()

    }
    
    @IBAction func login(_ sender: UIButton) {
        LoginAPI().login(email: emailTF.text!, password: passwordTF.text!, loginVc: self)
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSignUpWithPhone", sender: nil)
    }
    
    func didSuccess(response: UserResponse) {

        currentUser.userInfo = response.result
        
        let storyboard : UIStoryboard = UIStoryboard(name: "MainTabBar", bundle: nil)
        guard let mainVC = storyboard.instantiateViewController(withIdentifier: "MainTabBar") as? UITabBarController else { return }
        
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = mainVC
            UIView.transition(with: window, duration: 1, options: .transitionCrossDissolve ,animations: nil)
        }
//        else {
//            mainVC.modalPresentationStyle = .overFullScreen
//            self.present(mainVC, animated: true)
//        }
    }
    
    func didFailure() {
        let alert = UIAlertController(title: "로그인 실패", message: "입력된 정보가 올바르지 않습니다\n다시 시도하세요.", preferredStyle: UIAlertController.Style.alert)

        let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.cancel, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
    }
}
    

