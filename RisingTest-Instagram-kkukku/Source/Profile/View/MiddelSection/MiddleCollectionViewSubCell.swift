//
//  MiddleCollectionViewSubCell.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/10.
//

import UIKit
import Kingfisher

class MiddleCollectionViewSubCell: UICollectionViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 5
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        followButton.cornerRadius = 7
    }
    
    
    func updateUI(userInfo: RandomUserResult) {
        usernameLabel.text = userInfo.userName
        if userInfo.profileImage == nil || userInfo.profileImage == "nil" {
            profileImageView.image = UIImage(named: "defaultProfileImage")
        } else {
            guard let url = URL(string: userInfo.profileImage!)  else { return }
            profileImageView.kf.setImage(with: url)
        }
    }
}
