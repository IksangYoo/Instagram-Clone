//
//  ProfileCollectionViewCell.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/13.
//

import UIKit
import Kingfisher

class ProfileCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var postCountLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }
    
    
    func updateUI(with userInfo: UserProfileResult) {
        
        nameLabel.text = userInfo.name
        followingLabel.text = String(userInfo.following)
        followersLabel.text = String(userInfo.followers)
        postCountLabel.text = "\(userInfo.posts?.count ?? 0)"
        
        if userInfo.profileImage == nil || userInfo.profileImage == "nil" {
            profileImageView.image = UIImage(named: "defaultProfileImage")
        } else {
            guard let url = URL(string: userInfo.profileImage!)  else { return }
            profileImageView.kf.setImage(with: url)
        }
        
    }
}
