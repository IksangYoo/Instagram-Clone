//
//  ReelsCollectionViewCell.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/15.
//

import UIKit
import AVFoundation
import SnapKit

class ReelsCollectionViewCell: UICollectionViewCell {
    
    // 릴스
    let cellTitleLabel = UILabel()
    
    // 카메라
    let cameraImageView = UIImageView()
    
    // 댓글
    let commentImageView = UIImageView()
    
    // 좋아요
    let likeImageView = UIImageView()
    
    // 공유하기
    let shareImageView = UIImageView()
    
    let likeCountLabel = UILabel()
    
    let commentCountLabel = UILabel()
    
    let contentLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        for subview in contentView.subviews {
                subview.removeFromSuperview()
            }
    }
    
    func updateCell(with reels: ReelsModel) {
        let videoURL = Bundle.main.url(forResource: reels.fileName, withExtension: "mp4")
        
        let player = AVPlayer(url: videoURL!)
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
        playerLayer.videoGravity = .resizeAspectFill
        contentView.layer.addSublayer(playerLayer)
        
        setupAttribute()
        setupLayout()
        setUpLabelText(with: reels)
        player.play()
    }
    
    private func setupAttribute() {
        cellTitleLabel.text = "릴스"
        cellTitleLabel.font = .boldSystemFont(ofSize: 25)
        cellTitleLabel.textAlignment = .left
        cellTitleLabel.textColor = .white
        
        [cameraImageView, shareImageView, likeImageView, commentImageView]
            .forEach {
                $0.contentMode = .scaleAspectFit
                $0.tintColor = .white
            }
        [likeCountLabel, commentCountLabel]
            .forEach {
                $0.textColor = .white
                $0.font = .systemFont(ofSize: 13)
            }
        contentLabel.font = .boldSystemFont(ofSize: 15)
        contentLabel.textAlignment = .left
        contentLabel.textColor = .white
        
        cameraImageView.image = UIImage(systemName: "camera")
        shareImageView.image = UIImage(systemName: "paperplane")
        commentImageView.image = UIImage(systemName: "message")
        likeImageView.image = UIImage(systemName: "suit.heart")
    }
    
    private func setupLayout() {
        
        
        [cellTitleLabel, cameraImageView,
        likeImageView,
        commentImageView,
        shareImageView, likeCountLabel, commentCountLabel, contentLabel]
            .forEach { contentView.addSubview($0) }
        
        cellTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.leading.equalToSuperview().offset(20)
        }
        
        cameraImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-20)
            make.width.height.equalTo(35)
        }
        let space = CGFloat(40)
        
        likeImageView.snp.makeConstraints { make in
            make.bottom.equalTo(commentImageView.snp.top).offset(-space)
            make.centerX.equalTo(shareImageView)
            make.width.height.equalTo(30)
        }
        
        likeCountLabel.snp.makeConstraints { make in
            make.top.equalTo(likeImageView.snp.bottom).offset(3)
            make.centerX.equalTo(likeImageView)
        }
        
        commentImageView.snp.makeConstraints { make in
            make.bottom.equalTo(shareImageView.snp.top).offset(-space)
            make.centerX.equalTo(shareImageView)
            make.width.height.equalTo(30)
        }
        
        commentCountLabel.snp.makeConstraints { make in
            make.top.equalTo(commentImageView.snp.bottom).offset(3)
            make.centerX.equalTo(likeImageView)
        }
        
        shareImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.trailing.equalToSuperview().offset(-20)
            make.width.height.equalTo(30)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    private func setUpLabelText(with reels: ReelsModel) {
        likeCountLabel.text = String(reels.like)
        commentCountLabel.text = String(reels.commentCount)
        contentLabel.text = reels.content
    }
}
