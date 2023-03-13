//
//  UserProfileViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/13.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var userProfileResult: UserProfileResult?
    var userID : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // api
        ProfileAPI().getUserProfile(userID: userID ?? 0, userProfileVC: self)
    }
    
    func setCollectionView() {
        let profileNib = UINib(nibName: "ProfileCollectionViewCell", bundle: nil)
        collectionView.register(profileNib, forCellWithReuseIdentifier: "profileCell")
        
        let postNib = UINib(nibName: "PostCollectionViewCell", bundle: nil)
        collectionView.register(postNib, forCellWithReuseIdentifier: "postCell")
        
        let bottomSectionHeader = UINib(nibName: "PostHearder", bundle: nil)
        collectionView.register(bottomSectionHeader, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "PostHearder")
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func didSuccess(response: UserProfileResponse) {
        userProfileResult = response.result
        collectionView.reloadData()
        usernameLabel.text = userProfileResult?.userName
        print(userProfileResult?.userName)
    }
}

extension UserProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return userProfileResult?.posts?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let profileCell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileCell", for: indexPath) as? ProfileCollectionViewCell else { return UICollectionViewCell() }
            
            if let result = userProfileResult {
                profileCell.updateUI(with: result)
            }
            return profileCell
        } else {
            guard let postCell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as? PostCollectionViewCell else { return UICollectionViewCell() }
            
            if let posts = userProfileResult?.posts {
                let post = posts[indexPath.row]
                postCell.updateUI(with: post)
            }
            
            
            return postCell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            
            return CGSize(width: view.frame.width, height: 200)
            
        } else {
            let width = collectionView.frame.width / 3
            let height = width
            let inset : CGFloat = 1
            return CGSize(width: width - (inset * 2), height: height)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.section == 0 {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "PostHearder", for: indexPath)
                return headerView
        } else {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "PostHearder", for: indexPath) as! PostHearder
                return headerView
        }
    }
    
    // 섹션별 헤더 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: 0, height: 0)
        } else {
            return CGSize(width: view.frame.width, height: 40)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        } else {
            return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if section == 1 {
            return 1
        } else {
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if section == 1 {
            return 2
        } else {
            return 0
        }
    }
}
