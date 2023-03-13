//
//  BottomSectionCollectionViewCell.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/10.
//

import UIKit

class BottomSectionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var hasMoreThanOne: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func prepareForReuse() {
        postImageView.image = nil
    }
    
    func updateUI(post: MyPost) {
        let url = URL(string: post.itemImage)
        postImageView.kf.setImage(with: url)
        
        if post.hasMoreImages {
            hasMoreThanOne.isHidden = false
        } else {
            hasMoreThanOne.isHidden = true
        }
    }
}
