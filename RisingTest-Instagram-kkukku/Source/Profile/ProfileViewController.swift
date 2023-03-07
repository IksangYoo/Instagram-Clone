//
//  ProfileViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/07.
//

import UIKit

class ProfileViewController: UIViewController {
    let currentUser = CurrentUser.shared
    @IBOutlet weak var userId: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userId.text = "\(currentUser.userInfo!.userId)"
    }
}
