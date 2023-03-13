//
//  MiddleCollectionViewCell.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/10.
//

import UIKit

class MiddleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var randomUsers : [RandomUserResult]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let nib = UINib(nibName: "MiddleCollectionViewSubCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "subCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setRandomUser( _ randomUsers : [RandomUserResult]) {
        
        print("---------------------------- set randomUser")
        self.randomUsers = randomUsers
        collectionView.reloadData()
}


}

extension MiddleCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "subCell", for: indexPath) as! MiddleCollectionViewSubCell
        
        if let users = randomUsers {
            cell.updateUI(userInfo: users[indexPath.row])
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: collectionView.frame.height)
    }
    
    // 셀 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 4
    }
    
}
