//
//  HomeTableViewCell.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/08.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentUserName: UILabel!
    @IBOutlet weak var commentContent: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var topConst: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
//        removeCommentUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(post: PostResult) {
        if post.profileImage == nil {
            profileImageView.image = UIImage(named: "defaultProfileImage")
        } else {
            let url = URL(string: post.profileImage!)
            profileImageView.kf.setImage(with: url)
        }
        userNameLabel.text = post.userName
    }
    
    func removeCommentUI() {
        //TODO - 댓글 없을시 댓글 Ui 없애기
        commentUserName.isHidden = true
        commentContent.isHidden = true
        seeAllButton.isHidden = true
        
        topConst.constant = 10
    }
}
