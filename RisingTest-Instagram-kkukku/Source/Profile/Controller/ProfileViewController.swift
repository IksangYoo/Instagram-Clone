//
//  ProfileViewController.swift
//  RisingTest-Instagram-kkukku
//
//  Created by Iksang Yoo on 2023/03/07.
//

import UIKit

class ProfileViewController: UIViewController {
    let currentUser = CurrentUser.shared
    @IBOutlet weak var optionButton: UIBarButtonItem!
    @IBOutlet weak var plusButton: UIBarButtonItem!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var usernameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        registerXib()
        print(UserDefaults.standard.string(forKey: "email"))
        print(UserDefaults.standard.string(forKey: "password"))
        print(UserDefaults.standard.string(forKey: "jwt"))
    }
    
    
    @IBAction func optionButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToOptions", sender: nil)
    }
    
//    @IBAction func logout(_ sender: UIButton) {
//

//    }
    
    func setupNavigation() {
        let image1 = UIImage(named: "plus")?.withRenderingMode(.alwaysOriginal)
        let image2 = UIImage(named: "option")?.withRenderingMode(.alwaysOriginal)
        
        plusButton.image = image1
        optionButton.image = image2
        usernameButton.setTitle("kkukku", for: .normal)
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
            return 10
        }
        
    }
    
    // 각 섹션의 셀
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as? TopSectionCollectionViewCell else { return UICollectionViewCell()}
        
            return cell
            
        } else if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "middleCell", for: indexPath) as? MiddleCollectionViewCell else { return UICollectionViewCell()}
        
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath) as? BottomSectionCollectionViewCell else { return UICollectionViewCell()}
        
            return cell
            
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
