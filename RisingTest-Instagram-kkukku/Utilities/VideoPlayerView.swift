//
//  VideoPlayerView.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/15.
//

import UIKit
import AVKit

class VideoPlayerView: UIView {

    var playerLayer: AVPlayerLayer?
    var playerLooper: AVPlayerLooper? // 반복재생
    var queuePlayer: AVQueuePlayer? // 순서대로 자동재생
    var urlStr: String
    
    init(frame: CGRect, urlStr: String) {
        self.urlStr = urlStr
        super.init(frame: frame)
        
        let videoFileURL = Bundle.main.url(forResource: urlStr ,withExtension: "mp4")!
        let playItem = AVPlayerItem(url: videoFileURL)
        
        self.queuePlayer = AVQueuePlayer(playerItem: playItem)
        playerLayer = AVPlayerLayer()
        
        playerLayer!.player = queuePlayer
        playerLayer!.videoGravity = .resizeAspectFill
        
        self.layer.addSublayer(playerLayer!)
        
        playerLooper = AVPlayerLooper(player: queuePlayer!, templateItem: playItem)
        queuePlayer!.play()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func cleanup() {
        queuePlayer?.pause()
        queuePlayer?.removeAllItems()
        queuePlayer = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer!.frame = bounds
    }

}
