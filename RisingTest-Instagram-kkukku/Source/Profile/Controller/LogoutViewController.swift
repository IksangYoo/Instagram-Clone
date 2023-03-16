//
//  LogoutViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/10.
//

import UIKit
protocol settingsProtocol {
    func goToSettingVC()
}

class LogoutViewController: UIViewController {
    
    @IBOutlet var settingImageView: UIImageView!
    @IBOutlet weak var optionView: UIView!
    var delegate : settingsProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionView.layer.cornerRadius = 5
        addClickEvent()
    }
    
    
    func addClickEvent() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        settingImageView.addGestureRecognizer(tapGesture)
        settingImageView.isUserInteractionEnabled = true
    }
    
    @objc func imageTapped() {
        delegate?.goToSettingVC()
        dismiss(animated: true)
        print("imageTapped")
    }
}
