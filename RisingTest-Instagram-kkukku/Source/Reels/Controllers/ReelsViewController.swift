//
//  ReelsViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/15.
//

import UIKit
import AVFoundation

class ReelsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var reelsDummy = [ReelsModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        ReelsAPI().getReels(reelsVC: self)
    }
    
    func didSuccess(result: [ReelsModel]) {
        reelsDummy = result
        collectionView.reloadData()
    }
    
    func setCollectionView() {
        let nib = UINib(nibName: "ReelsCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "reelsCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setVideo() {
        let videoURL = Bundle.main.url(forResource: "dummyVideo02", withExtension: "mp4")
        
        let player = AVPlayer(url: videoURL!)
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        
        view.layer.addSublayer(playerLayer)
        
        player.play()
    }
}

//MARK: - UICollectionViewDelegate
extension ReelsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reelsDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reelsCell", for: indexPath) as? ReelsCollectionViewCell else { return UICollectionViewCell() }
        cell.updateCell(with: reelsDummy[indexPath.row])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ReelsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
