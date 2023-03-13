//
//  PostCollectionViewCell.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/13.
//

import UIKit
import Kingfisher

class PostCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var hasMoreThanOne: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(with post: UserPost) {
        let url = URL(string: post.itemImage)
        postImageView.kf.setImage(with: url)
        
        if post.hasMoreImages {
            hasMoreThanOne.isHidden = false
        } else {
            hasMoreThanOne.isHidden = true
        }
    }
}
