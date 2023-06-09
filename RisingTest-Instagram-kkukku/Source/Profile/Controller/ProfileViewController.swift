//
//  ProfileViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/07.
//

import UIKit

class ProfileViewController: UIViewController, settingsProtocol {

    let currentUser = CurrentUser.shared
    @IBOutlet weak var optionButton: UIBarButtonItem!
    @IBOutlet weak var plusButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var usernameButton: UIButton!
    var userInfo : MyProfileResult?
    var randomUsers : [RandomUserResult]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        registerXib()
        print(UserDefaults.standard.string(forKey: "email"))
        print(UserDefaults.standard.string(forKey: "password"))
        print(UserDefaults.standard.string(forKey: "jwt"))
        
        ProfileAPI().getMyProfile(profileVC: self)
        ProfileAPI().getRandomUser(myProfileVC: self)
    }
    
    func goToSettingVC() {
        print("delegate")
        performSegue(withIdentifier: "goToSettings", sender: nil)
    }
    
    @IBAction func optionButtonPressed(_ sender: UIBarButtonItem) {
        let logoutVC = self.storyboard?.instantiateViewController(identifier: "logoutVC") as! LogoutViewController
        logoutVC.delegate = self
        
        present(logoutVC, animated: true)
    }
    
    
    func setupNavigation() {
        let image1 = UIImage(named: "plus")?.withRenderingMode(.alwaysOriginal)
        let image2 = UIImage(named: "option")?.withRenderingMode(.alwaysOriginal)
        
        plusButton.image = image1
        optionButton.image = image2
        usernameButton.setTitle("", for: .normal)
    }
    
    func registerXib() {
        let topNib = UINib(nibName: "TopSectionCollectionViewCell", bundle: nil)
        collectionView.register(topNib, forCellWithReuseIdentifier: "topCell")
        
        let middleNib = UINib(nibName: "MiddleCollectionViewCell", bundle: nil)
        collectionView.register(middleNib, forCellWithReuseIdentifier: "middleCell")
        
        let middleSectionHeader = UINib(nibName: "MiddelSectionHeader", bundle: nil)
        collectionView.register(middleSectionHeader, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MiddelSectionHeader")
        
        let bottomSectionHeader = UINib(nibName: "BottomSectionHeader", bundle: nil)
        collectionView.register(bottomSectionHeader, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "BottomSectionHeader")
        
        let bottomNib = UINib(nibName: "BottomSectionCollectionViewCell", bundle: nil)
        collectionView.register(bottomNib, forCellWithReuseIdentifier: "bottomCell")
    }
    
    func didSuccess(response: MyProfileResult) {
        userInfo = response
        usernameButton.setTitle(userInfo?.userName, for: .normal)
        collectionView.reloadData()
    }
    
    func didRandomUserSuccess(randomUsers: [RandomUserResult]) {
        let section = 1
        let indexSet = IndexSet(integer: section)
        self.randomUsers = randomUsers
        print(randomUsers)
        collectionView.reloadSections(indexSet)
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    // 섹션 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    // 섹션별 셋 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return userInfo?.posts?.count ?? 0
        }
    }
    
    // 각 섹션의 셀
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let topCell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as? TopSectionCollectionViewCell else { return UICollectionViewCell()}
                
            if let myInfo = userInfo {
                topCell.updateUI(userInfo: myInfo)
            }
            
            return topCell
            
        } else if indexPath.section == 1 {
            guard let middleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "middleCell", for: indexPath) as? MiddleCollectionViewCell else { return UICollectionViewCell()}
            
            if let users = randomUsers {
                middleCell.setRandomUser(users)
            }
            
            
            
            return middleCell
            
        } else {
            guard let bottomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath) as? BottomSectionCollectionViewCell else { return UICollectionViewCell()}
        
            if let posts = userInfo?.posts {
                bottomCell.updateUI(post: posts[indexPath.row])
            }
            
            return bottomCell
            
        }
    }
    
    // 섹션별 셀 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            
            return CGSize(width: view.frame.width, height: 200)
        } else if indexPath.section == 1 {
            return CGSize(width: view.frame.width, height: 240)
        } else {
            let width = collectionView.frame.width / 3
            let height = width
            let inset : CGFloat = 1
            return CGSize(width: width - (inset * 2), height: height)
        }
    }
    
    // 섹션별  inset
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        } else if section == 1 {
            return UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 0)
        } else {
            return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        }
        
        
    }
    
    // 섹션별 헤더뷰
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.section == 1 {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MiddelSectionHeader", for: indexPath) as! MiddelSectionHeader
                // 헤더 뷰를 반환합니다.
                return headerView
        } else if indexPath.section == 2 {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "BottomSectionHeader", for: indexPath) as! BottomSectionHeader
                // 헤더 뷰를 반환합니다.
                return headerView
        } else {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MiddelSectionHeader", for: indexPath)
                return headerView
        }
    }
    
    // 섹션별 헤더 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: 0, height: 0)
        } else if section == 1 {
            return CGSize(width: view.frame.width, height: 30)
        } else {
            return CGSize(width: view.frame.width, height: 43)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if section == 2 {
            return 1
        } else {
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if section == 2 {
            return 2
        } else {
            return 0
        }
    }
}
