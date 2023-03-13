//
//  TopSectionCollectionViewCell.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/10.
//

import UIKit

class TopSectionCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }
    
    func updateUI(userInfo: MyProfileResult) {
        let url = URL(string: userInfo.profileImage!)
        profileImageView.kf.setImage(with: url!)
        nameLabel.text = userInfo.name
        followerLabel.text = String( userInfo.followers)
        followingLabel.text = String(userInfo.following)
    }
}
