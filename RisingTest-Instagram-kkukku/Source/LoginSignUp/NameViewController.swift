//
//  NameViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/05.
//

import UIKit

class NameViewController: UIViewController {

    @IBOutlet weak var nameTF: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTF.loginSignUpTextFieldUI(placeHolder: "이름 입력")
        nameTF.addUILabelAndButton()
    }
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goNext(_ sender: UIButton) {
        performSegue(withIdentifier: "goToPassword", sender: nil)
    }
    
}
