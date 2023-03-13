//
//  HomeTableViewCell.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/08.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var commentTopConst: NSLayoutConstraint!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentUserName: UILabel!
    @IBOutlet weak var commentContent: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var topConst: NSLayoutConstraint!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var postScrollView: UIScrollView!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        pageControl.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        postScrollView.delegate = self
        postScrollView.contentSize.width = contentView.frame.width
//        removeCommentUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        seeAllButton.isHidden = false
        commentUserName.isHidden = false
        commentContent.isHidden = false
        commentTopConst.constant = 28
        postScrollView.backgroundColor = .black
        
        topConst.constant = 60
        
        for subview in postScrollView.subviews {
                subview.removeFromSuperview()
            }
    }
    
    func updateCell(post: PostResult) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        let date = dateFormatter.date(from: post.createdAt)
        
        manageViewWhenNil(post: post)
        fetchImageToScrollView(urls: post.itemImages)
        
        userNameLabel.text = post.userName
        seeAllButton.setTitle("댓글 \(post.totalComment)개 모두 보기", for: .normal)
        commentUserName.text = post.userName
        commentContent.text = post.itemContent
        likeLabel.text = "좋아요 \(post.stars)개"
        dateLabel.text = date?.displayTimeAgo(date: date!)

    }
    
    private func manageViewWhenNil(post: PostResult) {
        //프로필 사진 없을시
        if post.profileImage == nil {
            profileImageView.image = UIImage(named: "defaultProfileImage")
        } else {
            let url = URL(string: post.profileImage!)
            profileImageView.kf.setImage(with: url)
        }
        
        // 댓글, 컨텐트 둘 다 없을 경우
        if post.totalComment == 0 && post.itemContent == nil {
            seeAllButton.isHidden = true
            commentUserName.isHidden = true
            commentContent.isHidden = true
            topConst.constant = 10
            // 댓글만 있을 경우
        } else if post.totalComment > 0 && post.itemContent == nil{
            seeAllButton.isHidden = false
            commentUserName.isHidden = true
            commentContent.isHidden = true
            topConst.constant = 30
            commentTopConst.constant = 10
            // 컨텐트만 있을 경우
        } else if post.totalComment == 0 && post.itemContent != nil {
            seeAllButton.isHidden = true
            topConst.constant = 35
        }
    }
    
    func fetchImageToScrollView(urls: [String]) {
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

extension HomeTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
    
    func setPageControlSelectedPage(currentPage:Int) {
        pageControl.currentPage = currentPage
    }
}
