//
//  SearchResultTableViewCell.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/12.
//

import UIKit
import Kingfisher

class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
    func updateUI(with searchResult: SearchUserResult) {
        if searchResult.profileImage == nil || searchResult.profileImage == "null" {
            profileImage.image = UIImage(named: "defaultProfileImage")
        } else {
            let url = URL(string: searchResult.profileImage!)
            profileImage.kf.setImage(with: url)
        }
    }
}

