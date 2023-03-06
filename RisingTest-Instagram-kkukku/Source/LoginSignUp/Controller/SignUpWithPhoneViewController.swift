//
//  SignUpWithPhoneViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/05.
//

import UIKit

class SignUpWithPhoneViewController: UIViewController {
    @IBOutlet weak var emailSignUpButton: UIButton!
    @IBOutlet weak var numberTF: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailSignUpButton.borderColor = UIColor.white.cgColor
        self.navigationController?.navigationBar.tintColor = UIColor.white
        numberTF.loginSignUpTextFieldUI(placeHolder: "휴대폰 번호")
        numberTF.addUILabelAndButton()
    }
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goToEmail(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSignUpWithEmail", sender: nil)
    }
    
}
