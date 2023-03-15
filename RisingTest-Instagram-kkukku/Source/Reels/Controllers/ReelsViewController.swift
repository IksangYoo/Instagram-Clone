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
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        ReelsAPI().getReels(reelsVC: self)
    }
    
    func didSuccess(result: [ReelsModel]) {
        reelsDummy = result
        collectionView.reloadData()
        startVideo(reels: reelsDummy)
    }
    
    func setCollectionView() {
        let nib = UINib(nibName: "ReelsCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "reelsCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    private func startVideo(reels: [ReelsModel]) {
        let videoURL = Bundle.main.url(forResource: reels[currentPage].fileName, withExtension: "mp4")
        let asset = AVURLAsset(url: videoURL!)
        let durationInSeconds = asset.duration.seconds
        
        let _ = Timer.scheduledTimer(withTimeInterval: durationInSeconds, repeats: false) { _ in
            self.moveNextPage()
            self.startVideo(reels: reels)
        }
    }
    
    private func moveNextPage() {
        
        currentPage += 1
        if (currentPage >= reelsDummy.count) {
            // 마지막페이지
            currentPage = 0
        }
        
        collectionView.scrollToItem(
            at: IndexPath(item: currentPage, section: 0),
            at: .centeredVertically,
            animated: true)
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
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? ReelsCollectionViewCell {
            cell.removePlayer()
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ReelsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
