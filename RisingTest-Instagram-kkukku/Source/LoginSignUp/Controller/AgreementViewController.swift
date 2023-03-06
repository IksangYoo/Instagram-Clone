//
//  AgreementViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/06.
//

import UIKit

class AgreementViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func agreeButtonPressed(_ sender: UIButton) {
        //TODO - 유저 생성
        performSegue(withIdentifier: "goToProfileImage", sender: nil)
    }
    
    @IBAction func goBack(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}
