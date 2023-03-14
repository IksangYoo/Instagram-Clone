//
//  PostDetailTableViewCell.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/14.
//

import UIKit
import Kingfisher

class PostDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var topConst: NSLayoutConstraint!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var AgoLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var postScrollView: UIScrollView!
    @IBOutlet weak var usernameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        pageControl.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func updateUI(with post: PostDetailResult) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        let date = dateFormatter.date(from: post.createdAt)
        let url = URL(string: post.profileImage!)
        
        fetchImageToScrollView(urls: post.itemImages)
        profileImageView.kf.setImage(with: url)
        likeLabel.text = "좋아요 \(post.stars)개"
        AgoLabel.text = "\(date?.displayTimeAgo(date: date!) ?? "") 전"
        
        if post.itemContent == nil {
            contentLabel.isHidden = true
            topConst.constant = 6
        } else {
            contentLabel.text = post.itemContent
        }
    }
    
    private func fetchImageToScrollView(urls: [String]) {
        for i in 0..<urls.count {
            let url = URL(string: urls[i])
            let postImageView = UIImageView()
            let xPos = self.contentView.frame.width * CGFloat(i)
            postImageView.image = nil
            postImageView.kf.setImage(with: url)
            postImageView.contentMode = .scaleToFill
            postImageView.frame = CGRect(x: xPos, y: 0, width: postScrollView.frame.width, height: postScrollView.frame.height)
            
            postScrollView.addSubview(postImageView)
            postScrollView.contentSize.width = postImageView.frame.width * CGFloat(i + 1)
        }
        pageControl.numberOfPages = urls.count
    }
}
