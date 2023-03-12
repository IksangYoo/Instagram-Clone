//
//  SearchTableViewCell.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/12.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
