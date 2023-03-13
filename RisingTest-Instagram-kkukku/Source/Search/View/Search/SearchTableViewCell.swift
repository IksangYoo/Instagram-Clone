//
//  SearchTableViewCell.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/12.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

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
        if searchResult.profileImage == nil || searchResult.profileImage == "nil" {
            profileImage.image = UIImage(named: "defaultProfileImage")
        } else {
            guard let url = URL(string: searchResult.profileImage!)  else { return }
            profileImage.kf.setImage(with: url)
        }
        nameLabel.text = searchResult.name
        usernameLabel.text = searchResult.userName
    }
}
